import React from 'react';
import './App.css';

function App() {
  // --- AWS INTEGRATION START ---
  const applyAWSDiscount = async (currentPrice) => {
    // Your verified Python Lambda URL
    const lambdaUrl = 'https://ueeuma5aksv4ox4xj4vi4bjyee0daurr.lambda-url.eu-central-1.on.aws/';

    try {
      const response = await fetch(lambdaUrl, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ price: currentPrice })
      });

      if (!response.ok) throw new Error('Network response was not ok');

      const data = await response.json();

      // Verification Alert
      alert(`${data.message}\nOriginal Price: $${currentPrice}\nNew Price: $${data.discountedPrice}`);

    } catch (error) {
      console.error("AWS Integration Error:", error);
      alert("Failed to connect to AWS Python Lambda.");
    }
  };
  // --- AWS INTEGRATION END ---

  return (
    <div className="App">
      <header className="App-header">
        <h1>AWS Grocery Store</h1>

        <p>Welcome to the Cloud Integrated Store!</p>

        {/* --- AWS BUTTON START --- */}
        <div style={{ padding: '20px', textAlign: 'center' }}>
          <button
              onClick={() => applyAWSDiscount(100)}
              style={{
                backgroundColor: '#FF9900',
                color: 'white',
                padding: '12px 24px',
                borderRadius: '8px',
                fontWeight: 'bold',
                cursor: 'pointer',
                border: 'none',
                boxShadow: '0px 4px 6px rgba(0,0,0,0.1)'
              }}
          >
            Apply AWS Cloud Discount (10% Off)
          </button>
        </div>
        {/* --- AWS BUTTON END --- */}

      </header>
    </div>
  );
}

export default App;