function Tpu = tprod1(Sp, Wp)
Ts = Sp;
sizp = size(Sp);
% for i = 1:length(Wp)
% 	if ~isempty(Wp{i})
% 		sizp(i) = size(Wp{i},1);
% 		Hp = ndim_unfold(Ts, i);
% 		Ts = ndim_fold(Wp{i}*Hp, i, sizp);
% 	end
% end
if ~isempty(Wp{1})
    sizp(1) = size(Wp{1},1);
    Hp = ndim_unfold(Ts, 1);
    Tp1 = ndim_fold(Wp{1}*Hp, 1, sizp);
end
if ~isempty(Wp{2})
    sizp(2) = size(Wp{2},1);
    Hp = ndim_unfold(Tp1, 2);
    Tpu = ndim_fold(Wp{2}*Hp, 2, sizp);
end
% if ~isempty(Wp{3})
%     sizp(3) = size(Wp{3},1);
%     Hp = ndim_unfold(Tp2, 3);
%     Tp3 = ndim_fold(Wp{3}*Hp, 3, sizp);
% end
% if ~isempty(Wp{4})
%     sizp(4) = size(Wp{4},1);
%     Hp = ndim_unfold(Tp3, 4);
%     Tpu = ndim_fold(Wp{4}*Hp, 4, sizp);
% end