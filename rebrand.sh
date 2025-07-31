#!/bin/bash
# Perform rebranding of DCscope -> CytoPlot
set -e
set -x

# Clone the original repository
git clone --depth 1 https://github.com/DC-analysis/DCscope.git project

# replace occurrences of DCscope in code
find './project' -name '?*.*' -exec sed -i 's|DC-analysis/DCscope|Rivercyte/CytoPlot|g' {} +
find './project' -name '?*.*' -exec sed -i 's/"DC-analysis"/"Rivercyte"/g' {} +
find './project' -name '?*.*' -exec sed -i 's/dc-cosmos.org/rivercyte.com/g' {} +
find './project' -name '?*.*' -exec sed -i 's/DCscope/CytoPlot/g' {} +
find './project' -name '?*.*' -exec sed -i 's/dcscope/cytoplot/g' {} +

# replace occurrences of DCscope in directory and file names
python3 rename_path.py 's/DCscope/CytoPlot/g' ./project
python3 rename_path.py 's/dcscope/cytoplot/g' ./project

# Also update the link to the documentation
find './project' -name '?*.*' -exec sed -i 's|cytoplot.readthedocs.io|rivercyte.com/download/cytoplot-docs|g' {} +


# replace icons
cp artwork/icon/cytoplot_icon_64.png project/cytoplot/img/icon.png
cp artwork/icon/cytoplot_icon_64.svg project/cytoplot/img/icon.svg
cp artwork/icon/cytoplot_icon.ico project/build-recipes/CytoPlot.ico
cp artwork/splash/cytoplot_splash.png project/cytoplot/img/splash.png
cp artwork/logo/cytoplot_h50.png project/docs/artwork/cytoplot_splash.png
