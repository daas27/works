% 读取数据
[x, fs] = audioread('Mix_speech_16k.wav');
x_length = length(x);
y_out = zeros(x_length, 2);
w = eye(2);

% FastICA参数
ita = 0.0001;
Ta = 1000;

for n = 1:x_length-Ta
    % 获取数据
    x_tmp = x(n:n+Ta-1,:);
    y = x_tmp * w.';
    y_out(n,:) = y(1,:);

    % ICA
    w = w + ita * (eye(2) - (tanh(y)'*y) / Ta) * w;
end

% 输出分离信号
y1_out = y_out(:,1);
y2_out = y_out(:,2);

% 标准化
y1_out = y1_out / max(max(abs(y1_out))) * 0.25;
y2_out = y2_out / max(max(abs(y2_out))) * 0.25;

% wav保存
audiowrite('Female_speech.wav', y1_out, 16000);
audiowrite('Male_speech.wav', y2_out, 16000);
