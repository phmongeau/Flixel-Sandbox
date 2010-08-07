MXMLC = mxmlc
FLIXEL = /Users/philippe/Documents/Flex/Library/flixel/
MAIN = SandBox.as
SWF = Game.swf

$(SWF) : $(MAIN)
	$(MXMLC) --source-path=$(FLIXEL) -o $(SWF) -- $(MAIN)
