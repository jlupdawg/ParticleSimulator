classdef ShotSimulator <handle

    properties
        Queue Shot
        limit = 10
        f matlab.ui.Figure
        ax matlab.graphics.axis.Axes
    end

    methods

        function obj = ShotSimulator()
            for i = 1:obj.limit
                obj.Queue(i) = Shot();
            end

            obj.f = figure;
            obj.ax = axes(obj.f);
            grid(obj.ax, 'on')
        end

        function SetShot(obj, type)
            idx = find([obj.Queue.type] == "UNUSED", 1, 'first');

            disp(idx)

            if(~isempty(idx))
                obj.Queue(idx).setType(type)
            end
        end

        function Run(obj)
            x = [-1 -1 1 1]*5;
            y = [-1 1 1 -1]*5;

            for i = 1:obj.limit
                patches(i) = patch(x, y, 'r', 'FaceColor', 'none', 'LineStyle', 'none');
            end

            axis(obj.ax, 'equal')
            xlim(obj.ax,[0 100])
            ylim(obj.ax,[0 100])

            hold(obj.ax, 'on')

            last_time = toc;
            while true

                this_time = toc;
                for i = 1:obj.limit
                    dt = this_time - last_time;

                    if(this_time - obj.Queue(i).startTime > 5)
                        obj.Queue(i).setType("UNUSED");
                    end

                    obj.Queue(i).particle.integrate(dt);

                    if(obj.Queue(i).particle.pos.xyz(2) < 0)
                        obj.Queue(i).setType("UNUSED");
                    end

                    %disp(1/dt)
                end

                for i = 1:obj.limit
                    if(obj.Queue(i).type == "UNUSED")
                        set(patches(i), 'FaceColor', "none");
                    else
                        set(patches(i), 'FaceColor',obj.Queue(i).color);
                        set(patches(i), 'YData', y + obj.Queue(i).particle.pos.xyz(2))
                        set(patches(i), 'XData', x + obj.Queue(i).particle.pos.xyz(3))
                    end
                end

                last_time = this_time;


                drawnow
            end
        end
    end
end

