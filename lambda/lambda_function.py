import json

def lambda_handler(event, context):
    try:
        # Get price from the request body
        body = json.loads(event.get('body', '{}'))
        price = body.get('price', 100)
        
        # Calculate 10% discount
        discounted_price = price * 0.90
        
        return {
            'statusCode': 200,
            'headers': {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*' # Crucial for React!
            },
            'body': json.dumps({
                'originalPrice': price,
                'discountedPrice': round(discounted_price, 2),
                'message': "Discount applied via AWS Python Lambda!"
            })
        }
    except Exception as e:
        return {
            'statusCode': 400,
            'body': json.dumps({'error': str(e)})
        }
