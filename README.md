# Gnucash automation robot

This robot demonstrates automating a desktop application with image recognition and OCR. The system under RPA is a cross platform free accounting software Gnucash.
This demo creates a new mock account and checks the current net assets.

Most of the interaction happens by locating a desired text by OCR. Regions and offsets are involved too - e.g. when you want to type text into an input field with a text label next to it, you first find the label, then get a region or offset relative to that text and click there.

For educational purposes both Python and Robot Framework keyword implementations are included. This is still a Robot Framework robot - just with an alternative way to define keywords.


## Note about OCR

OCR refers to recognizing characters, words, and text in general. Image recognition is more generic (and simpler) and might refer to the recognition of, e.g., colors and shapes.

OCR or image recognition based automation is usually the last resort in automation. When thinking whether you should use OCR to automate your application, first investigate if you could

* read the raw data programmatically,
* use native UI selectors,
* use UI hotkeys, or
* use the clipboard.

Usually image recognition must be used when dealing with Citrix (or similar). Even then hotkeys and the clipboard are oftentimes more reliable than pure OCR.

Another use case for OCR is reading text from documents (PDF, JPEG)- this demo does not consider that use case at all.

## Requirements

* Gnucash https://www.gnucash.org/
* rpaframework
* rpaframework-recognition


## Running the robot
The robot can be run with Robocorp Lab or rcc (https://github.com/robocorp/rcc).

```
git clone <this repo url>
cd gnucash-automation
rcc run
```

You can also run the robot in your own virtual environment, but you have to install the dependencies manually.

```
. venv/bin/activate
robot tasks
```
