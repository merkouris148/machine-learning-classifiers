clc
clear
format compact
%format long
close all


% φώρτωσε την εικόνα, μητρώο δεδομένων
load Salinas_hyperspectral
[p,n,l] = size(Salinas_Image);


% φώρτωσε τα διανύσματα ετικετών και ανασχημάτισέ τα σε μητρώα ετικετών
load classification_labels 
Training_Set_Labels = reshape(Training_Set, p,n); 
Test_Set_Labels = reshape(Test_Set, p,n);
Operational_Set_Labels = reshape(Operational_Set, p,n);


% από το αρχικό μητρώο δεδομένων παράγουμε 3 μητρώα δεδομένων, αυτά που αντιστοιχούν στα μητρώα
% ετικετών
Train_pixel_set = get_sub_pixel_set(Salinas_Image, Training_Set_Labels);
Test_pixel_set = get_sub_pixel_set(Salinas_Image, Test_Set_Labels);
Operational_pixel_set = get_sub_pixel_set(Salinas_Image, Operational_Set_Labels);


% ανασχηματίζουμε τα παραπάνω μητρώα σε διανύσματα (arrays) ώστε να μπορούμε να τα χειριστούμε
% καλύτερα στις συναρτήσεις εκπαίδευσης και αξιολόγισης


[Train_array, Train_array_response, Train_array_pos] = images2arrays(Training_Set_Labels, Train_pixel_set);
[Test_array, Test_array_response, Test_array_pos] = images2arrays(Test_Set_Labels, Test_pixel_set);
[Operational_array, Operational_array_response, Operational_array_pos] = images2arrays(Operational_Set_Labels, Operational_pixel_set);


% για την αποθήκευση των σχημάτων
mkdir("./figures");

% εκπαίδευση - δημιουργία ταξινομητών
figure(1), title("Train Set"), imagesc(Training_Set_Labels);
print("./figures/fg_1.png", "-dpng"); 


%k = estimate_k_parameter(Train_array, Train_array_response, 17); %!!!!!! ΑΠΟΣΧΟΛΙΑΣΕ ΑΥΤΗ ΤΗΝ ΓΡΑΜΜΗ ΠΡΙΝ ΤΟ ΠΑΡΑΔΩΣΕΙΣ!!!!!!
%knnc = knn_classifier(Train_array, Train_array_response, k)%;
knnc = knn_classifier(Train_array, Train_array_response, 1)%;
ec = euclidean_classifier(Train_array, Train_array_response)%;
nbc = naive_bayes_classifier(Train_array, Train_array_response)%;


% αξιολόγιpwdση ταξινομητών
% α) αξιολόγιση για το Test_Set

printf("\nTest Set:\n");

figure(2), title("Test Set"), imagesc(Test_Set_Labels);
print("./figures/fg_2_1.png", "-dpng");

knnc_test_labels = classify(knnc, Test_array);
ec_test_labels = classify(ec, Test_array);
nbc_test_labels = classify(nbc, Test_array);


[knnc_Test_Set_Labels, _] = arrays2images(Test_array, knnc_test_labels, Test_array_pos, p, n);
figure(3), title("k-Nearest Neighbors Classifier: Test Set"), imagesc(knnc_Test_Set_Labels);
print("./figures/fg_2_2.png", "-dpng");

[ec_Test_Set_Labels, _] = arrays2images(Test_array, ec_test_labels, Test_array_pos, p, n);
figure(4), title("Euclidean Classifier: Test Set"), imagesc(ec_Test_Set_Labels);
print("./figures/fg_2_3.png", "-dpng");

[nbc_Test_Set_Labels, _] = arrays2images(Test_array, nbc_test_labels, Test_array_pos, p, n);
figure(5), title("Naive Bayes Classifier: Test Set"), imagesc(nbc_Test_Set_Labels);
print("./figures/fg_2_4.png", "-dpng");

knnc_test_cm = calculate_confusion_matrix(knnc_test_labels, n_classes(knnc), Test_array_response)%;
ec_test_cm = calculate_confusion_matrix(ec_test_labels, n_classes(ec), Test_array_response)%;
nbc_test_cm = calculate_confusion_matrix(nbc_test_labels, n_classes(nbc), Test_array_response)%;

knnc_test_p = calculate_performance_from_cm(knnc_test_cm)%;
ec_test_p = calculate_performance_from_cm(ec_test_cm)%;
nbc_test_p = calculate_performance_from_cm(nbc_test_cm)%;

printf("\nOperational Set:\n");

figure(6), title("Operational Set"), imagesc(Test_Set_Labels);
print("./figures/fg_3_1.png", "-dpng");

knnc_op_labels = classify(knnc, Operational_array);
ec_op_labels = classify(ec, Operational_array);
nbc_op_labels = classify(nbc, Operational_array);


[knnc_Operational_Set_Labels, _] = arrays2images(Operational_array, knnc_op_labels, Operational_array_pos, p, n);
figure(7), title("k-Nearest Neighbors Classifier: Operational Set"), imagesc(knnc_Operational_Set_Labels);
print("./figures/fg_3_2.png", "-dpng");

[ec_Operational_Set_Labels, _] = arrays2images(Operational_array, ec_op_labels, Operational_array_pos, p, n);
figure(8), title("Euclidean Classifier: Operational Set"), imagesc(ec_Operational_Set_Labels);
print("./figures/fg_3_3.png", "-dpng");

[nbc_Operational_Set_Labels, _] = arrays2images(Operational_array, nbc_op_labels, Operational_array_pos, p, n);
figure(9), title("Naive Bayes Classifier: Operational Set"), imagesc(nbc_Operational_Set_Labels);
print("./figures/fg_3_4.png", "-dpng");

knnc_op_cm = calculate_confusion_matrix(knnc_op_labels, n_classes(knnc), Operational_array_response)%;
ec_op_cm = calculate_confusion_matrix(ec_op_labels, n_classes(ec), Operational_array_response)%;
nbc_op_cm = calculate_confusion_matrix(nbc_op_labels, n_classes(nbc), Operational_array_response)%;

knnc_op_p = calculate_performance_from_cm(knnc_op_cm)%;
ec_op_p = calculate_performance_from_cm(ec_op_cm)%;
nbc_op_p = calculate_performance_from_cm(nbc_op_cm)%;



















