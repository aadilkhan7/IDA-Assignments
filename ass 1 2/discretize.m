function y = discretize(x,lower,upper)
diff=upper-lower;
width=diff/5;
if(x>=lower && x<lower+width)
    y= 1;
    return;
end
if(x>=lower+width && x<lower+2*width)
    y=2;
    return;
end
if(x>= lower+2*width && x<lower+3*width)
    y=3;
    return;
end
if(x>=lower+3*width && x<lower+4*width)
    y=4;
    return;
end
if(x>=lower+4*width && x<=lower+5*width)
    y=5;
    return
end
end
