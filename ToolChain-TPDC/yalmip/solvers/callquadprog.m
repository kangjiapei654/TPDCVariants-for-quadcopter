function output = callquadprog(interfacedata)

% Author Johan Löfberg
% $Id: callquadprog.m,v 1.17 2007-08-02 11:39:36 joloef Exp $

options = interfacedata.options;
model = yalmip2quadprog(interfacedata);

if options.savedebug
    save quadprogdebug model
end

if options.showprogress;showprogress(['Calling ' interfacedata.solver.tag],options.showprogress);end
solvertime = clock;
if nnz(model.Q) == 0
    % BUG in LIN/QUADPROG, computation of lambda crashes in some rare
    % cases. To avoid seeing this when we don't want the lambdas anyway, we
    % don't ask for it
    if options.saveduals
        [x,fmin,flag,output,lambda] = linprog(model.c, model.A, model.b, model.Aeq, model.beq, model.lb, model.ub, x0,model.ops);
    else
        lambda = [];
        [x,fmin,flag,output] = linprog(model.c, model.A, model.b, model.Aeq, model.beq, model.lb, model.ub, x0,model.ops);
    end
else
    if options.saveduals
        [x,fmin,flag,output,lambda] = quadprog(model.Q, model.c, model.A, model.b, model.Aeq, model.beq, model.lb, model.ub, model.x0,model.ops);
    else
        lambda = [];
        [x,fmin,flag,output] = quadprog(model.Q, model.c, model.A, model.b, model.Aeq, model.beq, model.lb, model.ub, model.x0,model.ops);
    end
    if flag==5
        [x,fmin,flag,output,lambda] = quadprog(model.Q, model.c, model.A, model.b, model.Aeq, model.beq, model.lb, model.ub, [],model.ops);
    end
end
if interfacedata.getsolvertime solvertime = etime(clock,solvertime);else solvertime = 0;end

% Internal format for duals
if ~isempty(lambda)
    D_struc = [lambda.eqlin;lambda.ineqlin];
else
    D_struc = [];
end

% Check, currently not exhaustive...
problem = 0;
if flag==0
    problem = 3;
else
    if flag==-2
        problem = 1;
    else
        if flag>0
            problem = 0;
        else
            if isempty(x)
                x = repmat(nan,length(model.f),1);
            end
            if any((model.A*x-model.b)>sqrt(eps)) | any( abs(model.Aeq*x-model.beq)>sqrt(eps))
                problem = 1; % Likely to be infeasible
            else
                if model.f'*x<-1e10 % Likely unbounded
                    problem = 2;
                else          % Probably convergence issues
                    problem = 5;
                end
            end
        end
    end
end
infostr = yalmiperror(problem,'QUADPROG');

% Save all data sent to solver?
if options.savesolverinput
    solverinput= model;
else
    solverinput = [];
end

% Save all data from the solver?
if options.savesolveroutput
    solveroutput.x = x;
    solveroutput.fmin = fmin;
    solveroutput.flag = flag;
    solveroutput.output=output;
    solveroutput.lambda=lambda;
else
    solveroutput = [];
end

% Standard interface
output.Primal      = x(:);
output.Dual        = D_struc;
output.Slack       = [];
output.problem     = problem;
output.infostr     = infostr;
output.solverinput = solverinput;
output.solveroutput= solveroutput;
output.solvertime  = solvertime;