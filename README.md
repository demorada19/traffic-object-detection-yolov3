# Traffic Object Detection with YOLOv3

This repository contains an **object detection system for traffic surveillance** built using the **YOLOv3 deep learning model**.  
The project was completed as part of **CSE 573: Computer Vision and Image Processing (University at Buffalo)**, and its goal was to detect and analyze vehicles, pedestrians, and other traffic-related objects in **real-world video footage**.

The system processes video streams frame by frame, applies YOLOv3 detection, and computes **Intersection over Union (IoU)** to measure bounding box accuracy. It provides a foundation for intelligent traffic monitoring systems, accident analysis, and smart city applications.

---

## 📌 Motivation

Traffic congestion and road safety are critical issues in urban environments. Automatic detection of objects such as **cars, buses, bikes, trucks, and pedestrians** can:  

- Help design smarter traffic management systems  
- Assist in automated traffic violation detection  
- Enable **real-time accident prevention**  
- Provide data for **autonomous driving research**  

Traditional computer vision methods struggle with **dense, cluttered traffic scenes**. YOLOv3’s efficiency makes it well-suited for such real-time tasks.

---

## 🧠 Technical Background

### What is YOLOv3?
- YOLO (**You Only Look Once**) is a family of real-time object detection models.  
- Unlike traditional detectors that scan an image multiple times, YOLO predicts **bounding boxes and class probabilities in a single pass**, making it **fast and efficient**.  
- **YOLOv3** uses:
  - A **Darknet-53 backbone** for feature extraction  
  - **Multi-scale predictions** for better detection of small, medium, and large objects  
  - **Anchor boxes** to predict bounding box shapes  

### Why YOLOv3 for this project?
- **Fast inference speed** → suitable for real-time video streams  
- **Good balance of accuracy & efficiency**  
- Pretrained on the **COCO dataset (80 classes)**, which already includes traffic-relevant categories (car, bus, truck, person, bicycle, motorcycle, etc.)  

---


> ⚠️ `yolov3.weights` (~236 MB) is too large for GitHub; it can be downloaded via the provided script.  

---

## 📊 Methodology

1. **Input Video Feed**
   - A traffic surveillance video (e.g., `dhaka_traffic.mp4`) is used as the input source.  
   - The system can also work on live camera streams or other .mp4/.avi formats.  

2. **Preprocessing**
   - Each frame is resized to 416×416 (YOLOv3 input requirement).  
   - Normalization is applied for pixel scaling.  

3. **YOLOv3 Detection**
   - The pre-trained YOLOv3 model (COCO-trained) predicts bounding boxes.  
   - Outputs include:
     - Class label (car, bus, truck, person, etc.)  
     - Confidence score  
     - Bounding box coordinates  

4. **Post-processing**
   - Non-Maximum Suppression (NMS) removes redundant overlapping boxes.  
   - IoU (Intersection over Union) is computed between predicted and ground-truth boxes for evaluation.  

5. **Visualization**
   - Bounding boxes + labels are drawn on frames.  
   - IoU values are displayed when multiple overlapping boxes exist.  

---

## ⚙️ Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/rishishanthan/traffic-object-detection-yolov3.git
   cd traffic-object-detection-yolov3
    ```
2. Install dependencies
    pip install opencv-python numpy

3. Download YOLOv3 weights
    chmod +x download_weights.sh
    ./download_weights.sh

## ▶️ Running the Project
1. Run with shell script
    cd Code
    bash run.sh

2. Run directly with Python
    cd Code
    python Project.py --input /data/dhaka_traffic.mp4 --output /results/

## 📊 Results & Evaluation
The model detects cars, buses, trucks, motorcycles, and pedestrians reliably in dense traffic scenarios.
  - Real-time detection on 30 FPS video
  - IoU values calculated for bounding box overlap analysis

Example Output:
  - Input Video Frame	Detection + IoU will be printed out
  - IoU Metric: Used to quantify detection accuracy. An IoU ≥ 0.5 is considered a good detection.

## ⚠️ Limitations
  - YOLOv3 struggles with very small or heavily occluded objects.
  - Pretrained on COCO; not fine-tuned for local traffic datasets.
  - IoU calculation requires ground-truth labels for full evaluation (not included here).

## 🚀 Future Improvements
  - Upgrade to YOLOv4/YOLOv5 for higher accuracy.
  - Fine-tune on traffic-specific datasets (e.g., UA-DETRAC).
  - Extend to multi-camera traffic monitoring systems.
  - Deploy as a real-time web service (Flask/Streamlit).
