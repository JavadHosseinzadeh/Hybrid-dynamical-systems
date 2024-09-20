function dx = Gearbox_model(u,mode,x,sigma)
switch mode
    case 1
        dx1 = x(2);
        dx2 = gaussmf(x(2),[sigma 10])*u;
    case 2
        dx1 = x(2);
        dx2 = gaussmf(x(2),[sigma 25])*u;
    case 3
        dx1 = x(2);
        dx2 = gaussmf(x(2),[sigma 60])*u;
    case 4
        dx1 = x(2);
        dx2 = gaussmf(x(2),[sigma 90])*u;
end
dx = [dx1; dx2];
end

