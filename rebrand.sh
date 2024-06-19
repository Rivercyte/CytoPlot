#!/bin/bash
# Perform rebranding of Shape-Out2 -> CytoPlot
set -e
set -x

# Clone the original repository
git clone --depth 1 https://github.com/ZELLMECHANIK-DRESDEN/ShapeOut2.git project

# replace occurrences of Shape-Out in code
find './project' -name '?*.*' -exec sed -i 's/ZELLMECHANIK-DRESDEN/Rivercyte/g' {} +
find './project' -name '?*.*' -exec sed -i 's/Zellmechanik-Dresden/Rivercyte/g' {} +
find './project' -name '?*.*' -exec sed -i 's/zellmechanik.com/rivercyte.com/g' {} +
find './project' -name '?*.*' -exec sed -i 's/Shape-Out 2/CytoPlot/g' {} +
find './project' -name '?*.*' -exec sed -i 's/Shape-Out2/CytoPlot/g' {} +
find './project' -name '?*.*' -exec sed -i 's/Shape-Out/CytoPlot/g' {} +
find './project' -name '?*.*' -exec sed -i 's/ShapeOut2/CytoPlot/g' {} +
find './project' -name '?*.*' -exec sed -i 's/ShapeOut/CytoPlot/g' {} +
find './project' -name '?*.*' -exec sed -i 's/shapeout2/cytoplot/g' {} +
find './project' -name '?*.*' -exec sed -i 's/shapeout/cytoplot/g' {} +

# replace occurrences of Shape-Out in directory and file names
python3 rename_path.py 's/Shape-Out2/CytoPlot/g' ./project
python3 rename_path.py 's/Shape-Out/CytoPlot/g' ./project
python3 rename_path.py 's/ShapeOut2/CytoPlot/g' ./project
python3 rename_path.py 's/ShapeOut/CytoPlot/g' ./project
python3 rename_path.py 's/shapeout2/cytoplot/g' ./project
python3 rename_path.py 's/shapeout/cytoplot/g' ./project

# replace icons
cp artwork/icon/cytoplot_icon_64.png project/cytoplot/img/icon.png
cp artwork/icon/cytoplot_icon_64.svg project/cytoplot/img/icon.svg
cp artwork/icon/cytoplot_icon.ico project/build-recipes/CytoPlot.ico
cp artwork/splash/cytoplot_splash.png project/cytoplot/img/splash.png
