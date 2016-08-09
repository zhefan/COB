function drawBox(bbox, type, score)
%drawBox(bbox, type, score)

if ~exist('type', 'var')
    type = 'det';
end

if ~exist('score', 'var')
    score = zeros(size(bbox,1),1);
end

hold on

if size(bbox,1) == 1
    if isequal(type, 'gt')
        rectangle('Position',[bbox(1) bbox(2) (bbox(3)-bbox(1)+1) (bbox(4)-bbox(2)+1)], 'EdgeColor','g','LineWidth',4)
    elseif isequal(type, 'det')
        rectangle('Position',[bbox(1) bbox(2) (bbox(3)-bbox(1)+1) (bbox(4)-bbox(2)+1)], 'EdgeColor','r','LineWidth',4)
        text(double(bbox(1)), max(1,double(bbox(2))), sprintf('%.2f', score),...
            'Color','c','FontSize',12,'FontWeight','bold')
    elseif isequal(type, 'temp')
        rectangle('Position',[bbox(1) bbox(2) (bbox(3)-bbox(1)+1) (bbox(4)-bbox(2)+1)], 'EdgeColor','c','LineWidth',4)
        text(double(bbox(1)), max(1,double(bbox(2))), sprintf('%.2f', score),...
            'Color','w','FontSize',12,'FontWeight','bold')
    elseif isequal(type, 'match')
        rectangle('Position',[bbox(1) bbox(2) (bbox(3)-bbox(1)+1) (bbox(4)-bbox(2)+1)], 'EdgeColor','m','LineWidth',4)
        text(double(bbox(1)), max(1,double(bbox(2))), sprintf('%.2f', score),...
            'Color','w','FontSize',12,'FontWeight','bold')
    else
        error('Not such type')
    end
else
    for i = 1:size(bbox,1)
        if isequal(type, 'gt')
            rectangle('Position',[bbox(i,1) bbox(i,2) (bbox(i,3)-bbox(i,1)+1) (bbox(i,4)-bbox(i,2)+1)], 'EdgeColor','g','LineWidth',4)
        elseif isequal(type, 'det')
            rectangle('Position',[bbox(i,1) bbox(i,2) (bbox(i,3)-bbox(i,1)+1) (bbox(i,4)-bbox(i,2)+1)], 'EdgeColor','r','LineWidth',4)
            text(double(bbox(i,1)), max(1,double(bbox(i,2))), sprintf('%.2f', score(i)),...
                'Color','c','FontSize',12,'FontWeight','bold')
        elseif isequal(type, 'temp')
            rectangle('Position',[bbox(i,1) bbox(i,2) (bbox(i,3)-bbox(i,1)+1) (bbox(i,4)-bbox(i,2)+1)], 'EdgeColor','c','LineWidth',4)
            text(double(bbox(i,1)), max(1,double(bbox(i,2))), sprintf('%.2f', score(i)),...
                'Color','w','FontSize',12,'FontWeight','bold')
        elseif isequal(type, 'match')
            rectangle('Position',[bbox(i,1) bbox(i,2) (bbox(i,3)-bbox(i,1)+1) (bbox(i,4)-bbox(i,2)+1)], 'EdgeColor','m','LineWidth',4)
            text(double(bbox(i,1)), max(1,double(bbox(i,2))), sprintf('%.2f', score(i)),...
                'Color','w','FontSize',12,'FontWeight','bold')
        else
            error('Not such type')
        end
    end
    
end

hold off