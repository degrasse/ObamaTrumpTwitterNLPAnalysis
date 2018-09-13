
tweetsO = obamatweets2;
tweetsT = Trumptweets;

% compute the sentiment scores 
scoreFile = 'scoreFile.txt';

stopwordsURL ='http://www.textfixer.com/resources/common-english-words.txt';

sentimentsObama= processTweets.scoreSentiment(tweetsO,scoreFile,stopwordsURL);
sentimentsTrump = processTweets.scoreSentiment(tweetsT, scoreFile, stopwordsURL);