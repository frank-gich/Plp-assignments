# Iris Dataset Analysis
# This script loads, analyzes, and visualizes the Iris dataset using pandas, matplotlib, and seaborn.

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.datasets import load_iris

# Load the dataset
iris = load_iris()
df = pd.DataFrame(data=iris.data, columns=iris.feature_names)
df['species'] = iris.target
df['species'] = df['species'].map({0: 'setosa', 1: 'versicolor', 2: 'virginica'})

# Display first few rows
print("First few rows of the dataset:")
print(df.head())

# Data Exploration
print("\nDataset Information:")
print(df.info())

print("\nMissing Values:")
print(df.isnull().sum())

print("\nBasic Statistics:")
print(df.describe())

# Mean values grouped by species
print("\nMean values by species:")
print(df.groupby('species').mean())

# Set the style for better aesthetics
sns.set_style("whitegrid")

# Line Chart - Petal Length Trend
plt.figure(figsize=(8, 5))
plt.plot(df.index, df["petal length (cm)"], marker='o', linestyle='-', color='b', alpha=0.6)
plt.title("Trend of Petal Length Across Samples")
plt.xlabel("Sample Index")
plt.ylabel("Petal Length (cm)")
plt.show()

# Bar Chart - Average Petal Length per Species
plt.figure(figsize=(8, 5))
sns.barplot(x="species", y="petal length (cm)", data=df, palette="viridis")
plt.title("Average Petal Length by Species")
plt.xlabel("Species")
plt.ylabel("Average Petal Length (cm)")
plt.show()

# Histogram - Sepal Width Distribution
plt.figure(figsize=(8, 5))
sns.histplot(df["sepal width (cm)"], bins=15, kde=True, color='c')
plt.title("Distribution of Sepal Width")
plt.xlabel("Sepal Width (cm)")
plt.ylabel("Frequency")
plt.show()

# Scatter Plot - Sepal Length vs Petal Length
plt.figure(figsize=(8, 5))
sns.scatterplot(x="sepal length (cm)", y="petal length (cm)", hue="species", data=df, palette="coolwarm", s=80, alpha=0.8)
plt.title("Sepal Length vs Petal Length by Species")
plt.xlabel("Sepal Length (cm)")
plt.ylabel("Petal Length (cm)")
plt.legend(title="Species")
plt.show()

# Key Findings
print("\nKey Findings:")
print("- Setosa has distinct features, with the smallest petals.")
print("- Versicolor and Virginica overlap but show a trend of increasing sepal and petal lengths.")
print("- The dataset is well-structured with no missing values.")
