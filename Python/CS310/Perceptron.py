import numpy as np

class Perceptron(object):
    def __init__(self, no_inputs, max_iterations=20, learning_rate=0.1):
        self.no_inputs = no_inputs
        self.weights = np.ones(no_inputs) / no_inputs  # Initialize weights
        self.bias = 0
        self.max_iterations = max_iterations
        self.learning_rate = learning_rate

    def print_details(self):
        print("No. inputs:\t", self.no_inputs)
        print("Max iterations:\t", self.max_iterations)
        print("Learning rate:\t", self.learning_rate)

    def predict(self, inputs):
        print("------------------------")
        weighted_sum = np.dot(inputs, self.weights) + self.bias
        #print(weighted_sum)
        return 1 if weighted_sum >= 0 else 0

    def train(self, training_data, labels):
        assert len(training_data) == len(labels)

    def test(self, testing_data, labels):
        assert len(testing_data) == len(labels)
        print("Accuracy:\t" + str(accuracy) + "%")