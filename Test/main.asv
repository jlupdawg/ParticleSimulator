clc; clear; close all

a = ShotSimulator();

a.f.set('KeyPressFcn', @(src, event) myKeyPressFcn(src, event, a));

a.Run()


function myKeyPressFcn(~, evt, sim)

disp(evt.Key)
switch(evt.Key)
    case '1'
        sim.SetShot("PISTOL")
    case '2'
        sim.SetShot("ARTILLERY")
    case '3'
        sim.SetShot("FIREBALL")
    case '4'
        sim.SetShot("LASER")
end

end