classdef Particle <handle
    properties
        pos
        vel
        accel
        damping = 0.99
        inverseMass 
        g = 9.81
    end
    
    methods
        function obj = Particle(pos,vel, accel, mass)
            obj.pos = pos;
            obj.vel = vel;
            obj.accel = accel;
            obj.inverseMass = 1/mass;
        end
        
        function integrate(obj, duration)
            if (obj.inverseMass <= 0); return; end
            assert(duration>0)

            obj.pos.addScaledVector(obj.vel, duration);

            resultingAcc = obj.accel*obj.g;

            obj.vel.addScaledVector(resultingAcc, duration);

            obj.vel = obj.vel*(obj.damping^duration);
            
            obj.clearAccumulator()
        end
        function clearAccumulator(obj)
            return
        end


    end
end

