import numpy as np
import matplotlib.pyplot as plt

class Perceptron(object):
    def __init__(self, no_inputs, max_iterations, learning_rate):
        self.no_inputs = no_inputs
        self.weights = np.ones(no_inputs) / no_inputs
        self.bias = 1
        self.max_iterations = max_iterations
        self.learning_rate = learning_rate

    def print_details(self):
        print("No. inputs:\t", self.no_inputs)
        print("Max iterations:\t", self.max_iterations)
        print("Learning rate:\t", self.learning_rate)

    def predict(self, inputs):
        weighted_sum = np.dot(inputs, self.weights) + self.bias
        return 1 if weighted_sum > 0 else 0

    def train(self, training_data, labels):
        print("------TRAINING------")
        assert len(training_data) == len(labels)

        for i in range(self.max_iterations):
            for inputs, label in zip(training_data, labels):
                prediction = self.predict(inputs)
                error = label - prediction
                self.weights += self.learning_rate * error * np.array(inputs)
                self.bias += self.learning_rate * error

    def mTrain(self, training_data, labels):
        print("------TRAINING------")
        assert len(training_data) == len(labels)

        for i in range(self.max_iterations):
            for inputs, label in zip(training_data, labels):
                prediction = self.predict(inputs)
                error = label - prediction
                self.weights += self.learning_rate * error * np.array(inputs)

    def batchTraining(self,training_data, labels):
        print("------BATCH TRAINING------")
        for inputs, label in zip(training_data, labels):
            prediction = self.predict(inputs)
            error = label - prediction
            self.weights += self.learning_rate * error * np.array(inputs)

        self.weights += self.learning_rate * error * np.array(inputs)

    def visualize_weights(self):
        plt.imshow(self.weights[1:].reshape(28, 28), cmap="hot")
        plt.title("Updated Weights")
        plt.show()


    def test(self, testing_data, labels):
        print("------Testing------")
        assert len(testing_data) == len(labels)

        for i in range(len(testing_data)):
            print(f"Expected output: {labels[i]} -> Output: {self.predict(testing_data[i])}")

        correct_predictions = sum(self.predict(inputs) == label for inputs, label in zip(testing_data, labels))
        accuracy = correct_predictions / len(labels) * 100
        print("Accuracy:\t" + str(accuracy) + "%")

def andGate():
    training_data = np.array([[0,0], [0,1], [1,0], [1,1]])
    labels = np.array([0,0,0,1])
    
    perceptron = Perceptron(no_inputs=2, max_iterations=5, learning_rate=0.1)
    perceptron.print_details()
    print()
    perceptron.test(training_data, labels)
    print()
    perceptron.train(training_data, labels)
    print()
    perceptron.test(training_data, labels)

def minst():
    perceptron = Perceptron(no_inputs=785, max_iterations=20, learning_rate=0.1)
    perceptron.print_details()

    train_data = np.loadtxt("mnist_train.csv", delimiter=",")
    test_data = np.loadtxt("mnist_test.csv", delimiter=",")

    target_digit = 0
    train_input = [ np.append([1],d[1:]) for d in train_data ]
    train_label = [ int(d[0]==target_digit) for d in train_data ]
    test_label = [ int(d[0]==target_digit) for d in test_data ]

    perceptron.mTrain(train_input, train_label)
    perceptron.test(test_data, test_label)
    perceptron.visualize_weights()

def batch():
    perceptron = Perceptron(no_inputs=785, max_iterations=20, learning_rate=0.1)
    perceptron.print_details()

    train_data = np.loadtxt("mnist_train.csv", delimiter=",")
    test_data = np.loadtxt("mnist_test.csv", delimiter=",")

    target_digit = 3
    train_input = [ np.append([1],d[1:]) for d in train_data ]
    train_label = [ int(d[0]==target_digit) for d in train_data ]
    test_label = [ int(d[0]==target_digit) for d in test_data ]

    perceptron.batchTraining(train_input, train_label)
    perceptron.test(test_data, test_label)
    perceptron.visualize_weights()

#andGate()
#minst();
batch();