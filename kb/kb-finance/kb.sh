kb.options.black_scholes(){
cat << 'EOF'
Black-Scholes Call Price:
C = S₀N(d₁) - Ke^(-rT)N(d₂)

Where:
    d₁ = [ln(S₀/K) + (r + σ²/2)T] / (σ√T)
    d₂ = d₁ - σ√T

Parameters:
    S₀ = Current stock price
    K  = Strike price
    r  = Risk-free rate
    T  = Time to expiration (years)
    σ  = Volatility (annualized)
    N(·) = Cumulative normal distribution

Assumptions:
    - European options only
    - Constant volatility (major limitation)
    - No dividends
    - Efficient markets
EOF
}
