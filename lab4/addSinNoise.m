function[output] = addSinNoise(input_s, A, u0, v0)
    tic;
    inputSize = size(input_s);
    mask = zeros(inputSize);
    height = inputSize(1);
    width = inputSize(2);
    for row = 1:height
        for col = 1:width
           mask(row,col) = A * cos((u0*col + v0*row)*2*pi);
        end
    end
    %{
    mask_tmp = zeros(inputSize);
    for row = 1:height
        for col = 1:width
            mask_tmp(row,col) = mask(row,col)*(-1)^(row+col);
        end
    end
    %}
    imshow(log10(abs(myDFT2(mask))));
    
    output = input_s + mask;
    toc;
end

