import numpy as np
import matplotlib.pyplot as plt

class Perceptron(object):
    def __init__(self, no_inputs, max_iterations=20, learning_rate=0.1):
        self.no_inputs = no_inputs
        self.weights = np.ones(no_inputs) / no_inputs
        self.bias = 0
        self.max_iterations = max_iterations
        self.learning_rate = learning_rate

    def print_details(self):
        print("No. inputs:\t", self.no_inputs)
        print("Max iterations:\t", self.max_iterations)
        print("Learning rate:\t", self.learning_rate)

    def predict(self, inputs):
        weighted_sum = np.dot(inputs, self.weights)
        return 1 if weighted_sum >= 0 else 0

    def train(self, training_data, labels):
        print("------TRAINING------")
        assert len(training_data) == len(labels)

        for i in range(self.max_iterations):
            for inputs, label in zip(training_data, labels):
                prediction = self.predict(inputs)
                error = label - prediction

                self.weights += self.learning_rate * error * np.array(inputs)

    def visualize_weights(self):
        plt.imshow(self.weights[1:].reshape(28, 28), cmap="hot")
        plt.colorbar()
        plt.title("Learned Weights Visualization")
        plt.show()


    def test(self, testing_data, labels):
        print("------Testing------")
        assert len(testing_data) == len(labels)

        correct_predictions = sum(self.predict(inputs) == label for inputs, label in zip(testing_data, labels))
        accuracy = correct_predictions / len(labels) * 100
        print("Accuracy:\t" + str(accuracy) + "%")


perceptron = Perceptron(no_inputs=785, max_iterations=20, learning_rate=0.1)
perceptron.print_details()

train_data = np.loadtxt("mnist_train.csv", delimiter=",")
test_data = np.loadtxt("mnist_test.csv", delimiter=",")

target_digit = 7
train_input = [ np.append([1],d[1:]) for d in train_data ]# Separating the labels from the image
train_label = [ int(d[0]==target_digit) for d in train_data ]

perceptron.train(train_input, train_label)
perceptron.visualize_weights()