import numpy as np

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
        weighted_sum = np.dot(inputs, self.weights) + self.bias
        return 1 if weighted_sum >= 0 else 0

    def train(self, training_data, labels):
        assert len(training_data) == len(labels)

        for i in range(self.max_iterations):
            for inputs, label in zip(training_data, labels):
                prediction = self.predict(inputs)
                error = label - prediction

                self.weights += self.learning_rate * error * np.array(inputs)
                self.bias += self.learning_rate * error
            print(f"Iteration {i + 1}: Weights: {self.weights}, Bias: {self.bias}")


    def test(self, testing_data, labels):
        assert len(testing_data) == len(labels)
        for i in range(len(testing_data)):
            print(f"Expected output: {labels[i]} -> Output: {perceptron.predict(testing_data[i])}")

        correct_predictions = sum(self.predict(inputs) == label for inputs, label in zip(testing_data, labels))
        accuracy = correct_predictions / len(labels) * 100
        print("Accuracy:\t" + str(accuracy) + "%")



training_data = np.array([[0,0], [0,1], [1,0], [1,1]])
labels = np.array([0, 0, 0, 1])

perceptron = Perceptron(no_inputs=2, max_iterations=5, learning_rate=0.1)
perceptron.print_details()
print()
perceptron.test(training_data, labels)
print()
perceptron.train(training_data, labels)
print()
perceptron.test(training_data, labels)