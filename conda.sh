echo =============== PACKAGES ==============
conda update -n base conda
conda install --yes prefix
conda install --yes -c anaconda py-xgboost
conda install --yes pandas=0.24.2 requests=2.22.0 tqdm=4.31.1 seaborn=0.9.0 ipykernel=5.1.1 keras=2.2.4 lightgbm=2.2. ipywidgets=7.4.2 lxml=4.3.2 bottleneck=1.2.1
python -m pip install setuptools Jinja2==2.10
python -m pip install wordcloud skater==1.0.4
