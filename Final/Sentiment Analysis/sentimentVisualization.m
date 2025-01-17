% calculate the net sentiment rate
netSentO = (sum(sentimentsObama>=0)-sum(sentimentsObama<0))/length(sentimentsObama);
	
% simulate nsr assuming the pos/neg tweets follow normal distribution
nsr = zeros(1,100);
for i = 1:100
	sim = std(sentimentsObama).*randn(1,100);
	nsr(i) = (sum(sim>=0)-sum(sim<0))/length(sim);
end

% bin tweets by count
binranges = min(sentimentsObama):max(sentimentsObama);
bincounts = histc(sentimentsObama,binranges);

% separate positives and negatives into separate columns
bincounts = repmat(bincounts,[1,2]);
bincounts(1:17,1) = 0;
bincounts(18:21,2) = 0;


figure                                                      % new figure
histogram(sentimentsObama,'Normalization','probability')             % positive tweets
line([0 0], [0 .35],'Color','r');                           % reference line
title(['Sentiment Score Distribution of Obama Tweets ' ...   % add title
    sprintf('(NSR: %.2f)',netSentO)])
xlabel('Sentiment Score')                                   % x-axis label
ylabel('% Tweets')                                          % y-axis label
yticklabels(string(0:5:35))                                 % y-axis ticks
text(-10,.25,'Negative');text(3,.25,'Positive');    

% plot the sentiment histogram
figure
subplot(2,1,1)
bar(binranges,bincounts,'histc')
xlabel('Sentiment Score')
ylabel('Tweets')
legend('Positive','Negative','Location','Best')
title('Sentiment Analysis - OBAMA Tweets')
text(-15,50,sprintf('Net Sentiment Rate \n (Positives-Negatives/Total) = %.2f',...
netSentO))

% plot NSR simulation result
subplot(2,1,2)
plot(1:100,nsr)
hold on
plot(50,netSentO,'ro')
xlabel('Trials')
ylabel('Net Sentiment Rate')
legend('Simulated NSR','Actual NSR','Location','Best')
text(52,netSentO,num2str(netSentO))
hold off



% calculate the net sentiment rate
netSentT = (sum(sentimentsTrump>=0)-sum(sentimentsTrump<0))/length(sentimentsTrump);
	
% simulate nsr assuming the pos/neg tweets follow normal distribution
nsrT = zeros(1,100);
for i = 1:100
	sim = std(sentimentsTrump).*randn(1,100);
	nsrT(i) = (sum(sim>=0)-sum(sim<0))/length(sim);
end

% bin tweets by count
binrangesT = min(sentimentsTrump):max(sentimentsTrump);
bincountsT = histc(sentimentsTrump,binrangesT);

% separate positives and negatives into separate columns
bincountsT = repmat(bincountsT,[1,2]);
bincountsT(1:17,1) = 0;
bincountsT(18:21,2) = 0;

figure                                                      % new figure
histogram(sentimentsTrump,'Normalization','probability')             % positive tweets
line([0 0], [0 .35],'Color','r');                           % reference line
title(['Sentiment Score Distribution of Trump Tweets ' ...   % add title
    sprintf('(NSR: %.2f)',netSentT)])
xlabel('Sentiment Score')                                   % x-axis label
ylabel('% Tweets')                                          % y-axis label
yticklabels(string(0:5:35))                                 % y-axis ticks
text(-10,.25,'Negative');text(3,.25,'Positive');    

% plot the sentiment histogram
figure
subplot(2,1,1)
bar(binrangesT,bincountsT,'histc')
xlabel('Sentiment Score')
ylabel('Tweets')
legend('Positive','Negative','Location','Best')
title('Sentiment Analysis - TRUMP Tweets')
text(-15,50,sprintf('Net Sentiment Rate \n (Positives-Negatives/Total) = %.2f',...
netSentT))

% plot NSR simulation result
subplot(2,1,2)
plot(1:100,nsrT)
hold on
plot(50,netSentT,'ro')
xlabel('Trials')
ylabel('Net Sentiment Rate')
legend('Simulated NSR','Actual NSR','Location','Best')
text(52,netSentT,num2str(netSentT))
hold off