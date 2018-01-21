function [ zeroCrossingPixels ] = findZeroCrossingPixels( image )
    dimension = size(image, 1);
    zeroCrossingPixels = zeros(dimension);
    for i = 2:dimension-1
        for j = 2:dimension-1
            pixelValue = image(i,j);
            if image(i-1,j-1) ~= pixelValue || image(i-1,j) ~= pixelValue || image(i-1,j+1) ~= pixelValue || image(i,j-1) ~= pixelValue || image(i,j+1) ~= pixelValue || image(i+1,j-1) ~= pixelValue || image(i+1,j) ~= pixelValue || image(i+1,j+1) ~= pixelValue
                zeroCrossingPixels(i,j) = 1;
            end
        end
        
        if image(1,i) ~= image(1,i-1) || image(1,i) ~= image(2, i-1) || image(i,i) ~= image(2,i) || image(1,i) ~= image(2,i+1) || image(1,i) ~= image(1,i+1)
            zeroCrossingPixels(1,i) = 1;
        end
        
        if image(dimension, i) ~= image(dimension, i-1) || image(dimension, i) ~= image(dimension-1, i-1) || image(dimension, i) ~= image(dimension-1, i) || image(dimension, i) ~= image(dimension-1, i+1) || image(dimension, i) ~= image(dimension, i+1)
            zeroCrossingPixels(dimension,i) = 1;
        end
        
        if image(i,1) ~= image(i-1, 1) || image(i,1) ~= image(i-1,2) || image(i,1) ~= image(i,2) || image(i,1) ~= image(i+1,2) || image(i,1) ~= image(i+1,1)
            zeroCrossingPixels(i,1) = 1;
        end
        
        if image(i,dimension) ~= image(i-1,dimension) || image(i,dimension) ~= image(i-1,dimension-1) || image(i,dimension) ~= image(i,dimension-1) || image(i,dimension) ~= image(i+1,dimension-1) || image(i,dimension) ~= image(i+1,dimension)
            zeroCrossingPixels(i,dimension) = 1;
        end
    end
    
    %Special check conditions for the corners
    if(image(1,1) ~= image(1,2) || image(1,1) ~= image(2,1) || image(1,1) ~= image(2,2)) 
        zeroCrossingPixels(1,1) = 1;
    end
    
    if(image(1,dimension) ~= image(1,dimension-1) || image(1,1) ~= image(2,dimension) || image(1,1) ~= image(2,dimension-1)) 
        zeroCrossingPixels(1,dimension) = 1;
    end
    
    if(image(dimension,1) ~= image(dimension-1,1) || image(dimension,1) ~= image(dimension,2) || image(dimension,1) ~= image(dimension-1,2)) 
        zeroCrossingPixels(dimension,1) = 1;
    end
    
    if(image(dimension,dimension) ~= image(dimension-1,dimension) || image(dimension,dimension) ~= image(dimension-1,dimension-1) || image(dimension,dimension) ~= image(dimension,dimension-1)) 
        zeroCrossingPixels(dimension,dimension) = 1;
    end
end