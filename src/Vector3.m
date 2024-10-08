classdef Vector3 < handle
    properties
        xyz(1,3)
    end

    methods
        function obj = Vector3(varargin)

            if(length(varargin) == 1)
                obj.xyz = varargin{1};

            else
                obj.xyz = [0 0 0];
            end
        end

        function invert(obj)
            obj.xyz = -obj.xyz;
        end

        function out = magnitude(obj)
            out = sqrt(sum(obj.xyz.^2));
        end
        function out = squareMagnitude(obj)
            out = sum(obj.xyz.^2);
        end
        function normalize(obj)
            len = obj.magnitude();
            if(len > 0)
                obj.xyz = obj.xyz/len;
            end
        end

        function scale(obj, value)
            obj.xyz = obj.xyz*value;
        end


        function add(obj, obj2)
            obj.xyz = obj.xyz + obj2.xyz;
        end

        function out = plus(obj, value)
            out = obj.xyz + value;
            out = Vector3(out);
        end

        function subtract(obj, obj2)
            obj.xyz = obj.xyz - obj2.xyz;
        end

        function out = minus(obj, value)
            out = obj.xyz - value;
            out = Vector3(out);
        end

        function addScaledVector(obj, obj2, scale)
            obj.xyz = obj.xyz + obj2.xyz*scale;
        end

        function out = componentProduct(obj, obj2)
            out = obj.xyz.*obj2.xyz;
            out = Vector3(out);
        end

        function componentProductUpdate(obj, obj2)
            obj.xyz = obj.xyz.*obj2.xyz;
        end

        function out = scalarProduct(obj, obj2)
            out = sum(obj.xyz.*obj2.xyz);
        end

        function out = mtimes(obj, obj2)
            if(isnumeric(obj2))
                out = obj.xyz*obj2;
                out = Vector3(out);
            else
                out = sum(obj.xyz.*obj2.xyz);
            end
        end

        function out = vectorProduct(obj, obj2)
            out = Vector3(cross(obj.xyz, obj2.xyz));
        end

         function mldivide(obj, obj2)
            obj.xyz = cross(obj.xyz, obj2.xyz);
         end

         function makeOrthonormalBasis(obj, obj2, obj3)
             obj.normalize()
             obj3 = vectorProduct(obj, obj2);
             if(c.squareMagnitude() == 0)
                 return
             end
             obj3.normalize();
             obj2 = vectorProduct(obj, obj3);
         end

    end
end

