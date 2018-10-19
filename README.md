# p25MatrixModels
openscad and stl files to create brackets for p25 matrix displays


Different panels seem to have different screw spacing. Edit the openscad and generate new STL files if your spacing doesn't match.
This library will kick out brackets to attach the panels together, as well as hang the power supplies, terminal strips, and receiving boards off the back.

https://www.aliexpress.com/item/32x32-Indoor-RGB-3in1-Small-Pixel-Pitch-HD-P2-5-Full-Color-160mm-x-160mm-LED/32728364405.html?spm=a2g0s.9042311.0.0.3ac84c4dsWJo2M

http://www.novastar-led.com/product_detail.php?id=147&cid=42&pid=24

https://www.amazon.com/gp/product/B010UDG6NG/ref=oh_aui_search_detailpage?ie=UTF8&psc=1

inside the https://github.com/alanswx/p25MatrixModels/tree/master/piholder folder is a model to hook a raspberry pi up to the side of one of the panels. This was originally used because I tried to run the panels from a pi. The Novastar board works much better, but the model is included if you need it. Otherwise if you are using a send/recv system like the novastar it is unlikely you would attach the pi to the display.
