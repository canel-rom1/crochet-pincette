# GNU General Public License v3 - https://www.gnu.org/licenses/gpl.txt
# May 2017, Rom1 <rom1@canel.ch> - CANEL - https://www.canel.ch


OPENSCAD=openscad
VIEWER=fstl
TARGET=crochet
SRC=$(TARGET).scad
DEPS=.$(TARGET).deps
STL=$(TARGET).stl


all: $(TARGET)

$(TARGET): $(STL)

$(STL): $(SRC)
	$(OPENSCAD) -m make -o $@ -d $(DEPS) $<

.PHONY: clean mrproper

preview: $(STL)
	$(VIEWER) $<

clean:
	rm -fr $(DEPS)

mrproper:
	rm -fr $(DEPS) $(STL)
