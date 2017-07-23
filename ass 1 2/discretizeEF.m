function y = discretizeEF(x,edge)
if(x>=edge(1) && x<edge(2))
    y=1;
    return;
end
if(x>=edge(2) && x<edge(3))
    y=2;
    return;
end
if(x>= edge(3) && x< edge(4))
    y=3;
    return;
end
if(x>= edge(4) && x< edge(5))
    y=4;
    return;
end
if(x>= edge(5))
    y=5;
    return
end
end