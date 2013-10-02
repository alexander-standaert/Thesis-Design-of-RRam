function str = spval2str(val)

str = cell(0);

for I=1:length(val)
    if isnumeric(val{I})
        if length(val{I})>1
            str{I} = mat2str(val{I});
            str{I} = str{I}(2:end-1);
        else
            str{I} = num2str(val{I},'%0.8g');
        end
    else
        str{I} = val{I};
    end
end
