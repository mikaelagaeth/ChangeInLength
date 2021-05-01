function []= changeInLength
close all;

global gui;
    gui.fig = figure('numbertitle', 'off', 'name', 'Change in Length Finder')
    set ( gui.fig, 'Color', [1 1 1] )
    gui.deltaL = uicontrol('style','text','units','normalized', 'position', [.15 .40 .12 .095], 'string', 'Change in Length (cm)', 'horizontalalignment','right');
    gui.mass = uicontrol('style','text','units','normalized', 'position', [.34 .43 .13 .06], 'string', 'Mass of Weight', 'horizontalalignment','right');
    gui.diameter = uicontrol('style','text','units','normalized', 'position', [.55 .43 .15 .06], 'string', 'Diameter of Pipe', 'horizontalalignment','right');
    gui.lengthOfPipe = uicontrol('style','text','units','normalized', 'position', [.74 .43 .13 .06], 'string', 'Length of Pipe', 'horizontalalignment','right');
%text boxes for everything
    gui.buttonGroup1 = uibuttongroup('visible','on','unit','normalized','position', [0.33 0.2 .15 .25], 'selectionchangedfcn', {@radioSelect1});
        gui.r1= uicontrol(gui.buttonGroup1,'style', 'radiobutton', 'units' , 'normalized' , 'position', [0.1 0.8 1 .2], 'HandleVisibility', 'off', 'string' , 'Kilograms');
        gui.r2= uicontrol(gui.buttonGroup1,'style', 'radiobutton', 'units' , 'normalized' , 'position', [0.1 0.5 1 .2], 'HandleVisibility', 'off', 'string' , 'Grams');
        gui.r3= uicontrol(gui.buttonGroup1,'style', 'radiobutton', 'units' , 'normalized' , 'position', [0.1 0.2 1 .2], 'HandleVisibility', 'off', 'string' , 'Pounds'); 
    %radio control buttons for Mass
     gui.buttonGroup2 = uibuttongroup('visible','on','unit','normalized','position', [0.55 0.2 .15 .25], 'selectionchangedfcn', {@radioSelect2});
        gui.r1= uicontrol(gui.buttonGroup2,'style', 'radiobutton', 'units' , 'normalized' , 'position', [0.04 0.8 1 .2], 'HandleVisibility', 'off', 'string' , 'Centimeters');
        gui.r2= uicontrol(gui.buttonGroup2,'style', 'radiobutton', 'units' , 'normalized' , 'position', [0.04 0.5 1 .2], 'HandleVisibility', 'off', 'string' , 'Meters');
        gui.r3= uicontrol(gui.buttonGroup2,'style', 'radiobutton', 'units' , 'normalized' , 'position', [0.04 0.2 1 .2], 'HandleVisibility', 'off', 'string' , 'Inches'); 
    %radio control buttons for Diameter
     gui.buttonGroup3 = uibuttongroup('visible','on','unit','normalized','position', [0.73 0.2 .15 .25], 'selectionchangedfcn', {@radioSelect3});
        gui.r1= uicontrol(gui.buttonGroup3,'style', 'radiobutton', 'units' , 'normalized' , 'position', [0.04 0.8 1 .2], 'HandleVisibility', 'off', 'string' , 'Centimeters');
        gui.r2= uicontrol(gui.buttonGroup3,'style', 'radiobutton', 'units' , 'normalized' , 'position', [0.04 0.5 1 .2], 'HandleVisibility', 'off', 'string' , 'Meters');
        gui.r3= uicontrol(gui.buttonGroup3,'style', 'radiobutton', 'units' , 'normalized' , 'position', [0.04 0.2 1 .2], 'HandleVisibility', 'off', 'string' , 'Inches'); 
    %radio control buttons for Length
    
        gui.massBox=uicontrol('style','Edit', 'string','0','Units','normalized', 'Position',[0.36 0.50 0.1 0.1],'backgroundcolor','c','Tag','EditField')
        gui.diameterPipe=uicontrol('style','Edit', 'string','0','Units','normalized', 'Position',[0.57 0.50 0.1 0.1],'backgroundcolor','g','Tag','EditField');
        gui.lengthPipe=uicontrol('style','Edit', 'string','0','Units','normalized', 'Position',[0.75 0.50 0.1 0.1],'backgroundcolor','y','Tag','EditField');
        gui.changeInLengthBox= uicontrol('style','Edit', 'string','X', 'Units','normalized','Position',[0.15 0.5 0.12 0.12],'backgroundcolor','c', 'Tag','EditField2','Enable','off');
        gui.calculate = uicontrol('Style','PushButton', 'String','Calculate Change in Length', 'Units','normalized','Position',[0.1 0.7 0.8 0.10],'callback',{@lengthFunction},'backgroundcolor','m','FontSize',14);
%edit boxes
gui.massEdit=0;
gui.lengthEdit=0;
gui.diameterEdit=0;%sets zero so they can be compared in function at bottom.
end
%radio select button- input is taken

function [] = radioSelect1(~,~)
global gui;
    type= gui.buttonGroup1.SelectedObject.String
        
    textEditMass(type);
end
%input is put into this if function to see if units need to be changed
function []= textEditMass(type)
global gui;

gui.currentMass=str2num(gui.massBox.String);
  
    if strcmp(type,'Kilograms')
        gui.massEdit= (gui.currentMass);
        
    elseif strcmp(type,'Grams')
        gui.massEdit = (gui.currentMass/1000);
        
    elseif strcmp(type,'Pounds')
        gui.massEdit = (gui.currentMass/2.2046); 
        
    end


end
%radio select button- input is taken

function [] = radioSelect3(~,~)
global gui;
    type= gui.buttonGroup3.SelectedObject.String
        
    textEditLength(type);
end
%input is put into this if function to see if units need to be changed
function []= textEditLength(type)
global gui;

gui.currentLength=str2num(gui.lengthPipe.String);
  
    if strcmp(type,'Centimeters')
        gui.lengthEdit= (gui.currentLength);
        
    elseif strcmp(type,'Meters')
        gui.lengthEdit = (gui.currentLength*1000);
        
    elseif strcmp(type,'Inches')
        gui.lengthEdit = (gui.currentLength/2.54); 
        
    end


end
%radio select button- input is taken
function [] = radioSelect2(~,~)
global gui;
    type= gui.buttonGroup2.SelectedObject.String
        
    textEditDiameter(type);
end
%input is put into this if function to see if units need to be changed
function []= textEditDiameter(type)
global gui;

gui.currentDiameter=str2num(gui.diameterPipe.String);
  
    if strcmp(type,'Centimeters')
        gui.diameterEdit= (gui.currentDiameter);
        
    elseif strcmp(type,'Meters')
        gui.diameterEdit = (gui.currentDiameter*1000);
        
    elseif strcmp(type,'Inches')
        gui.diameterEdit = (gui.currentDiameter/2.54); 
        
    end


end





function []= lengthFunction(~,~)% Function to calculate change in Length
global gui;
        %these allow for the radio button not to be pressed if the units do
        %not need to be changed.
        if gui.massEdit==0
        gui.massEdit=str2num(gui.massBox.String);
        end
    
        if gui.lengthEdit==0
        gui.lengthEdit=str2num(gui.lengthPipe.String);
        end
    
        if gui.diameterEdit==0
        gui.diameterEdit=str2num(gui.diameterPipe.String)
        end
    
    gui.newMass=(gui.massEdit)
    gui.newLength = (gui.lengthEdit)
    gui.newDiameter = (gui.diameterEdit)
    
    gui.a = (((gui.newMass*10)/((3.1415/4)*(gui.newDiameter * gui.newDiameter)))/1000000)
    b = ((gui.a/200)*gui.newLength)
    gui.changeInLengthBox.String = num2str(b);


end




