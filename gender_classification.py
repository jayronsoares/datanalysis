from sklearn import tree

clf = tree.DecisionTreeClassifier()

# DESAFIO - CRIAR 3 MAIS CLASSIFICADORES...
# 1
# 2
# 3

# [altura, peso, tamanho_pé]
X = [[181, 80, 44], [177, 70, 43], [160, 60, 38], [154, 54, 37], [166, 65, 40],
     [190, 90, 47], [175, 64, 39],
     [177, 70, 40], [159, 55, 37], [171, 75, 42], [181, 85, 43]]

Y = ['masculino', 'masculino', 'feminino', 'feminino', 'masculino', 'masculino', 'feminino', 'feminino',
     'feminino', 'masculino', 'masculino']


# DESAFIO - ...e treinar nossos dados
clf = clf.fit(X, Y)

prediction = clf.predict([[190, 70, 43]])

# desafio: comparar os resultados

print(prediction)
