# This examples use the basics algorithms of sklearn, XGBooting and KEras.
# Setting up
# data handling

import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, OneHotEncoder

# naive bayes
from sklearn.naive_bayes import GaussianNB

# nearest neighbors
from sklearn.neighbors import KNeighborsClassifier

# neural networks
from keras.layers.advanced_activations import LeakyReLU
from keras.layers.core import Activation, Dense, Dropout
from keras.models import Sequential

# SVM
from sklearn.svm import LinearSVC, SVC

# Tree Bboosting
from xgboost import XGBClassifier

# Measures
from keras.metrics import categorical_accuracy
from sklearn.metrics import accuracy_score
import timeit

# Using TensorFlow backend.

results = {}
# Import and prepare data
# Read the csv file
iris = pd.read_csv('../datasets/iris.csv', index_col='Id')

# get X,y data
X = iris.as_matrix(iris.columns[0:-1])

lenc = LabelEncoder()
y = iris['Species'].as_matrix()
y = lenc.fit_transform(y)

# shuffle and split into train and test sets
X_train, X_test, y_train, y_test = train_test_split(X, y)

ohenc = OneHotEncoder()
ohenc.fit(y.reshape((-1, 1)))
y_train_oh = ohenc.transform(y_train.reshape((-1, 1))).toarray()
y_test_oh = ohenc.transform(y_test.reshape((-1, 1))).toarray()

# Support Vector Classification
ALGOS = {'LinearSVC': LinearSVC(),'SVC': SVC()}

for algo, model in ALGOS.items():
    def fn():
        model.fit(X_train, y_train)
        t = timeit.timeit(fn, number=1)
        y_pred = model.predict(X_test)
        y_pred = [round(value) for value in y_pred]
        accuracy = accuracy_score(y_test, y_pred)
        results[algo] = {'training_time': t, 'accuracy': accuracy}

# Nearest Neighbors
model = KNeighborsClassifier()

def fn():
    model.fit(X_train, y_train)
    t = timeit.timeit(fn, number=1)


y_pred = model.predict(X_test)
y_pred = [round(value) for value in y_pred]
accuracy = accuracy_score(y_test, y_pred)

results['KNeighbors'] = {'training_time': t, 'accuracy': accuracy}

# Naive Bayes
model = GaussianNB()

def fn():
    model.fit(X_train, y_train)
    t = timeit.timeit(fn, number=1)


y_pred = model.predict(X_test)
y_pred = [round(value) for value in y_pred]
accuracy = accuracy_score(y_test, y_pred)

results['GaussianNB'] = {'training_time': t, 'accuracy': accuracy}

# Boosted Trees
model = XGBClassifier()

def fn():
    model.fit(X_train, y_train)
    t = timeit.timeit(fn, number=1)

y_pred = model.predict(X_test)
y_pred = [round(value) for value in y_pred]
accuracy = accuracy_score(y_test, y_pred)

results['XGBoost'] = {'training_time': t, 'accuracy': accuracy}
# Neural Networks
EPOCHS, LAYERS, UNITS = 100, 4, 8
ACTIVATIONS = {
    'leaky_relu': LeakyReLU(),
    'relu': Activation('relu'),
    'selu': Activation('selu'),
    'sigmoid': Activation('sigmoid'),
    'tanh': Activation('tanh')
}


for name, activation in ACTIVATIONS.items():
    model = Sequential()
    model.add(Dense(UNITS, input_dim=4))
    for l in range(LAYERS):
        if l != 0:
            model.add(Dense(UNITS))
        model.add(activation)
    model.add(Dense(3))
    model.add(Activation('softmax'))
    model.compile(
        optimizer='adam',
        loss='categorical_crossentropy',
        metrics=['accuracy']
    )
    
    def fn():
        model.fit(X_train, y_train_oh, epochs=EPOCHS, verbose=0)
        t = timeit.timeit(fn, number=1)
    
    accuracy = model.evaluate(X_test, y_test_oh, verbose=0)[1]
    
    results['Neural Network ({})'.format(name)] = {'training_time': t, 'accuracy': accuracy}

#Results
for algo in sorted(results.keys()):
    print('{}\n  Accuracy:{:>8.2%}\n  Time:{:>11.3}s'.format(
        algo, 
        float(results[algo]['accuracy']),
        results[algo]['training_time']
    ))
