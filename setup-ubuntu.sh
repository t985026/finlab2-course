pip install jupyterlab

echo ================= TALIB ===============
python -m pip install setuptools Jinja2==2.10.1 joblib==0.13.2
python -m pip install eli5 pyfolio
python -m pip install TA-Lib
python -m pip install xgboost shap mlxtend seaborn

echo ======== JUPYTER LAB IPYWIDGETS ======
conda install nodejs
jupyter labextension install @jupyter-widgets/jupyterlab-manager
