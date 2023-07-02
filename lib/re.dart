import 'package:flutter/material.dart';
import 're2.dart';
void main()=> runApp(MaterialApp(
home: kartik(),
));
class kartik extends StatefulWidget {
  @override
  State<kartik> createState() => _kartikState();
}

class _kartikState extends State<kartik> {
  List<Quote>quotes = [
    Quote(author: 'Ralph Waldo Emerson', text: 'Life is a Journey,Not a Destination.'),
    Quote(author: 'the Bible', text: "The love of money is the root of all evil."),
    Quote(author: 'Franklin D. Roosevelt', text: 'The only thing we have to fear is fear itself.')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Awesome quotes'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(
            quote: quote,
            delete: () {
              setState(() => quotes.remove(quote));
            }
        )).toList(),
      ),
    );
  }
}


class QuoteCard extends StatelessWidget {
  final Quote quote;
  final  delete;
  QuoteCard({required this.quote,required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              quote.author,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800]
              ),
            ),
            SizedBox(height: 9),
            TextButton.icon(
              onPressed:delete,
              label: Text('delete quote'),
              icon: Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}