import time

import numpy as np
from matplotlib import pyplot as plt, pyplot
from pandas import read_csv
from sklearn.model_selection import train_test_split
from tensorflow.keras import Sequential
from tensorflow.keras.layers import Dense


ins_file = 'unsplit_900x5_Shuf_4prior_0_diff_alignDCT_sent_ins.csv'


labs_file = 'unsplit_900x5_Shuf_4prior_0_diff_alignDCT_sent_labs.csv'

# Read inputs and labels
# split into input and output columns
X = read_csv(ins_file, header=None)
y = read_csv(labs_file, header=None)
# split into train and test datasets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.33)
print(X_train.shape, X_test.shape, y_train.shape, y_test.shape)

def modelling(X_train, y_train, X_test, y_test):
    # All model work should be submitted in this function
    # THis includes creation, training, evaluation etc.

    # determine the number of input features
    n_features = X_train.shape[1]

    # Create model
    model = Sequential()
    

    # Return model at end
    return model

def visualisation(X_test, y_test, model):

    # Evaluate
    error = model.evaluate(X_test, y_test, verbose=0)
    print('MSE: %.3f, RMSE: %.3f' % (error, np.sqrt(error)))

    # A fairly simple visualisation, pick 6 at random and compare output to actual
    labelNo = [1500,5789, 11370,24, 501, 25999]

    fig = plt.figure()
    for labels in range(0,len(labelNo)):
        # Extrac data and convert to list
        row = X_test.iloc[labelNo[labels], :]
        # Extract the values only as an array and convert
        row = row.values
        row = row.tolist()

        # Predict output
        yhat = model.predict([row])

        # Get labels from test set
        lab = y_test.iloc[labelNo[labels], :]

        # Specify plot no
        plotCount = int('3'+'2'+str(labels))


        # Add a subplot covering screen
        ax = fig.add_subplot(plotCount+1)
        plt.plot(lab)
        plt.plot(yhat[0])
    plt.show()


def extras_view_input_data(X_test, labelNo):
    # Extras, create a figure to look at the input data

    # Extrac data and convert to list
    row = X_test.iloc[labelNo, :]
    # Extract the values only as an array and convert
    row = row.values
    row = row.tolist()

    fig_inps = plt.figure()
    # Add a subplot covering screen
    ax = fig_inps.add_subplot(111)
    # Plot data on subplot
    ax.plot(row)
    # Show on screen6
    plt.show()

def extras_view_label(y_test, labelNo):
    # Display prediction

    lab = y_test.iloc[labelNo,:]
    fig_inps = plt.figure()
    # Add a subplot covering screen
    ax = fig_inps.add_subplot(111)
    # Plot data on subplot
    ax.plot(lab)
    # Show on screen6
    plt.show()
