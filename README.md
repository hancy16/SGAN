# SGANs --spherical generative adversarial networks
## Implemented in PyTorch

by Yiping Duan, Chaoyi Han, Xiaoming Tao, Bingrui Geng, Yunfei Du, and Jianhua Lu.

## Overview
This repository is modified from [Spherical CNNs](https://arxiv.org/abs/1801.10130) and [High-Resolution Image Synthesis and Semantic Manipulation with Conditional GANs](https://tcwang0509.github.io/pix2pixHD/). 

##Installation
  - Clone this repo:

   ```
   git clone https://github.com/hancy16/SGAN
   cd SGAN

  - Install s2cnn dependencies

   (commands to install all the dependencies on a new conda environment)

   ```bash
   conda create --name cuda9 python=3.6 
   conda activate cuda9

   # s2cnn deps
   #conda install pytorch torchvision cuda90 -c pytorch # get correct command line at http://pytorch.org/
   conda install -c anaconda cupy  
   pip install pynvrtc  

   # lie_learn deps
   conda install -c anaconda cython  
   conda install -c anaconda requests  

   # shrec17 example dep
   conda install -c anaconda scipy  
   conda install -c conda-forge rtree shapely  
   conda install -c conda-forge pyembree  
   pip install "trimesh[easy]"  
   ```

   - Installation

   ```bash
   $ python setup.py install
   ```

## Usage

##Training on AOI datasets

   - Download the AOI dataset and corresponding sketch maps from [AOI](https://drive.google.com/open?id=1iXZSFXUzI3QK9wBfrJfN3yjIasUiu67m) and [AOI_Sketch](https://drive.google.com/drive/u/0/folders/1JjgHm_5HROoeuHA67RYD--GJR8iaFmko). Rename the folds following the paradigm in ./datasets/AOI/. 

   - Run the script:
   ```
   ./train_AOI.sh
   ```

   - Testing with trained model

   ```
   ./test_AOI.sh
   ```
##Training on SYNTHIA datasets
   - Download the panoramic images we use at [SYNTHIA_Panoramic](https://drive.google.com/drive/u/0/folders/10BF1hZQnndj-Yi-2vX7gGwww1f6i8jP9). Rename the folds following the paradigm in ./datasets/synthia/. 

   - Run the script:
   ```
   ./train_synthia.sh
 

   - Testing with trained model

   ```
   ./test_synthia.sh
   ```


##Generate panoramic images

   - The code for generating panoramic images from original SYNTHIA datasets can be seen in ./matlab/. One example is also provided.
