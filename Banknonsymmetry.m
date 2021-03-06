
load('Asymmetricbank');
N=20;
for j=2:60
    
    WB=zeros(N,N);
    bank=zeros(N,N);
    
    bank(:,:)=wBank_N(j,:,:);
    
    
    WB=bank;
    [VB, DB] = eig(WB);             %diagonal D is eigenvalues and V is eigenvectors
    EigenvalueB(:,j-1)=diag(DB);
    MaxEig_B(1,j-1)=real(max(EigenvalueB(:,j-1)));
    IPRMAX_B(:,j-1)=1./(sum(VB(:,end).^4));
    IPRB(:,j-1)=1./(sum(VB.^4));
    
end;

Date=['2000/05';'2000/08';'2000/11';'2001/02';'2001/05';'2001/08';'2001/11';'2002/02';'2002/05';'2002/08';'2002/11'; '2003/02';'2003/05';'2003/08';'2003/11'; '2004/02';'2004/05';'2004/08';'2004/11';'2005/02';'2005/05';'2005/08';'2005/11';'2006/02';'2006/05';'2006/08';'2006/11';'2007/02';'2007/05';'2007/08';'2007/11';'2008/02';'2008/05';'2008/08';'2008/11';'2009/02';'2009/05';'2009/08';'2009/11'; '2010/02';'2010/05';'2010/08';'2010/11';'2011/02';'2011/05';'2011/08';'2011/11';'2012/02';'2012/05';'2012/08';'2012/11';'2013/02';'2013/05';'2013/08';'2013/11';'2014/02';'2014/05';'2014/08';'2014/11'];
celldata = cellstr(Date);
figure
subplot(2,1,1);
plot(MaxEig_B,'.-');
xlabel('Time');
ylabel('MaxEig');
set(gca, 'XTick',1:10:59, 'xticklabel',celldata(1:10:59));
subplot(2,1,2);
plot(IPRMAX_B,'.-');
xlabel('Time');
ylabel('IPRMax');
set(gca, 'XTick',1:10:59, 'xticklabel',celldata(1:10:59));