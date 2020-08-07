# ---------------
# SAGEMAKER SETUP
# ---------------

cd /home/ec2-user/SageMaker
 
sudo yum -y install zsh

zsh

aws configure

# ======================================
# setup Julia

vshort="1.5"
vlong="1.5.0"

curl https://julialang-s3.julialang.org/bin/linux/x64/$vshort/julia-$vlong-linux-x86_64.tar.gz --output julia-$vlong.tar.gz
tar -xzvf julia-$vlong.tar.gz
rm julia-$vlong.tar.gz

export PATH="$PATH:/home/ec2-user/SageMaker/julia-$vlong/bin/"

# ======================================
# setup Python

pip install --upgrade pip
pip install --upgrade numpy scipy pandas tqdm matplotlib seaborn
