import pandas as pd
import os

ROOT_PATH = "C:\\Users\\usuario\\Documents\\deep learning\\dogs vs cats\\"

TRAIN_PATH_TOT = ROOT_PATH + "train\\"
TEST_PATH_TOT = ROOT_PATH + "test\\test\\"

MINI_TRAIN_PATH = ROOT_PATH + "mini-train\\"
MINI_TEST_PATH = ROOT_PATH + "mini-test\\"

TRAIN_PATH = TRAIN_PATH_TOT
TEST_PATH = TEST_PATH_TOT


ls_train_files = pd.read_csv('3-Machine Learning/4-Deep Learning/2-Redes Convolucionales/train_files.csv')
ls_test_files = pd.read_csv('3-Machine Learning/4-Deep Learning/2-Redes Convolucionales/test_files.csv')

ls_train_files = ls_train_files['filename'].tolist()
ls_test_files = ls_test_files['filename'].tolist()

def copy_img(ls_files, from_path, to_path):
    import shutil
    for file in ls_files:
        shutil.copy(from_path + file, to_path)

copy_img(ls_train_files, TRAIN_PATH, MINI_TRAIN_PATH)
copy_img(ls_test_files, TRAIN_PATH, MINI_TEST_PATH)