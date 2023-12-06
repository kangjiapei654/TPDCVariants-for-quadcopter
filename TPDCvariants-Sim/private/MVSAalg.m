function [S_mvsa,U_mvsa,S1,Error]=MVSAalg(hull,U, lpvdata, dep)
% S1:           MVS
% S_mvs         core tensor after MVS manipulation
%
%
U = genhull(U, hull);
S = coretensor(U, lpvdata, dep);
Usize2=size(U,2);
for ii=1:Usize2
    [UsizeM,UsizeN]=size(U{ii});
    U1=[U{ii},ones(UsizeM,1)];

    [V,Sigm,Bt]=svd(U1,'econ'); %A=USV' econ
    T0{ii}=Sigm*Bt'*[eye(UsizeN);zeros(1,UsizeN)];% Sigma B'E
    J=size(V,2);
    [Ae, indice, Rp ]= VCA(V,'Endmembers',J,'SNR',0,'verbose',1);%VCA to guess R0

    R=V(indice,:);
    % figure(1)
    % for ij=1:size(R,2)-1
    %     subplot(2,2,ij)
    %     plot(V(:,ij),V(:,ij+1),'o')
    %     hold on 
    %     plot(R(:,ij),R(:,ij+1),'*')
    % end
    % R0=V(indice,:)+randi(J,1)*(V(indice,:)-sum(V(indice,:))/J);
    % pause(2)
    % close all
    [M1,Up,Q,my,sing_values] = mvsa(V',UsizeN+1,'M0',0,'spherize','yes'); %  Minimum Volume Simplex Analysis (MVSA),
    %Up'*Up=I_N, U{ii}'*U{ii}=I_N£¬M=Up/Q=>M*Q=Up
    % norm(M-Up/Q,'fro')
    S1{ii}=inv(M1)*V';% V'=MS->V=S'M'-2008 MVS
    mean(sum(S1{ii}),2)% equiv 1,mean the right weight
    norm(S1{ii}'*M1'-V,1)% W=S',Rinv=M'.
    W1{ii}=S1{ii}';
    %sum(W1,2)
    T1{ii}=M1'*T0{ii}; %60x3
    Error{ii}=norm(W1{ii}*T1{ii}-U{ii},'fro')% U=WT
end

% ii=2 could not make M feasible
S_mvsa = tproddimi(S, T1{1}, 1); % S \times _1 T
U_mvsa{1}=W1{1};
for ii=2:Usize2
    S_mvsa = tproddimi(S_mvsa, T1{ii}, ii); % S \times _1 T
    U_mvsa{ii}=W1{ii};

end
end
