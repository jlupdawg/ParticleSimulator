classdef Shot <handle
    properties
        particle
        type
        startTime
        color
    end

    methods
        function obj = Shot()
            obj.particle = Particle(Vector3([0 0 0]), Vector3([0 0 0]), Vector3([0 0 0]), 0);
            obj.setType("UNUSED");
        end

        function setType(obj, type)
            switch(type)

                case "PISTOL"
                    obj.particle.inverseMass = 1/2;
                    obj.particle.vel = Vector3([0 0 35]);
                    obj.particle.accel = Vector3([0 -1 0]);
                    obj.particle.damping = 0.99;
                    obj.color = 'k';
                case "ARTILLERY"
                    obj.particle.inverseMass = 1/200;
                    obj.particle.vel = Vector3([0 30 50]);
                    obj.particle.accel = Vector3([0 -20 0]);
                    obj.particle.damping = 0.99;
                    obj.color = 'b';
                case "FIREBALL"
                    obj.particle.inverseMass = 1/1;
                    obj.particle.vel = Vector3([0 0 10]);
                    obj.particle.accel = Vector3([0 0.6 0]);
                    obj.particle.damping = 0.9;
                    obj.color = 'r';
                case "LASER"
                    obj.particle.inverseMass = 1/0.1;
                    obj.particle.vel = Vector3([0 0 100]);
                    obj.particle.accel = Vector3([0 0 0]);
                    obj.particle.damping = 0.99;
                    obj.color = 'c';
            end


            obj.particle.pos = Vector3([0,10,0]);
            obj.startTime = toc;
            obj.type = type;

            obj.particle.clearAccumulator();
        end

    end
end

