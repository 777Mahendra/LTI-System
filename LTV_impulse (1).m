function y = LTV_impulse(x, H)
    [N, L] = size(H);
    y = zeros(N + L - 1, 1); % Preallocate output vector
    
    % Compute the LTV system response
    for n = 1:(N + L - 1)
        accumulated_sum = 0;
        for k = max(1, n - L + 1):min(n, N)
            accumulated_sum = accumulated_sum + x(k) * H(k, n - k + 1);
        end
        y(n) = accumulated_sum;
    end
end