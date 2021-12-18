import 'package:flutter/material.dart';
import 'package:tips_and_tricks/common/styles.dart';
import 'package:tips_and_tricks/methods/add_data.dart';
import 'package:tips_and_tricks/models/article.dart';
import 'package:tips_and_tricks/widgets/custom_scaffold.dart';
import 'list_page.dart';

class AddArticlePage extends StatefulWidget {
  static const routeName = '/add_article';

  const AddArticlePage({Key? key}) : super(key: key);

  @override
  State<AddArticlePage> createState() => _AddArticlePageState();
}

class _AddArticlePageState extends State<AddArticlePage> {
  late String articleTitle;
  late String articleSource;
  late String articlePublishedDate;
  late String imageUrl;
  late String articleUrl;
  late String briefDescription;

  DateTime selectedDate = DateTime.now();
  final TextEditingController _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1990, 1),
        lastDate: DateTime(2022));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        articlePublishedDate = picked.toString().substring(0, 10);
        _dateController.text = picked.toString().substring(0, 10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _dateController.text = selectedDate.toString().substring(0, 10);
    articlePublishedDate = selectedDate.toString().substring(0, 10);
    return SafeArea(
      child: CustomScaffold(
        theTitle: 'Add New Article',
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 15.0,
              left: 15.00,
              top: 50.00,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Fill All the Fields",
                        style: myTextTheme.headline4?.apply(
                          color: darkSecondaryColor,
                          fontWeightDelta: 1,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 35.00,
                              right: 35.00,
                              top: 20.00,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Please enter article title';
                                }
                                articleTitle = value!;
                              },
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: darkSecondaryColor,
                                  ),
                                ),
                                labelText: 'Title',
                                labelStyle: TextStyle(
                                  color: darkSecondaryColor,
                                ),
                              ),
                              cursorColor: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 35.00,
                              right: 35.00,
                              top: 20.00,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Please enter article source/author';
                                }
                                articleSource = value!;
                              },
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: darkSecondaryColor,
                                  ),
                                ),
                                labelText: 'Article Source/Author',
                                labelStyle: TextStyle(
                                  color: darkSecondaryColor,
                                ),
                              ),
                              cursorColor: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 35.00,
                              right: 35.00,
                              top: 20.00,
                            ),
                            child: TextFormField(
                              controller: _dateController,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: darkSecondaryColor,
                                  ),
                                ),
                                labelText: 'Article Publish Date',
                                labelStyle: const TextStyle(
                                  color: darkSecondaryColor,
                                ),
                                suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.calendar_today_rounded,
                                  ),
                                  onPressed: () => _selectDate(context),
                                ),
                              ),
                              cursorColor: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 35.00,
                              right: 35.00,
                              top: 20.00,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Please enter image url';
                                }
                                imageUrl = value!;
                              },
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: darkSecondaryColor,
                                  ),
                                ),
                                labelText: 'Image URL',
                                labelStyle: TextStyle(
                                  color: darkSecondaryColor,
                                ),
                              ),
                              cursorColor: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 35.00,
                              right: 35.00,
                              top: 20.00,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Please enter article url';
                                }
                                articleUrl = value!;
                              },
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: darkSecondaryColor,
                                  ),
                                ),
                                labelText: 'Article URL',
                                labelStyle: TextStyle(
                                  color: darkSecondaryColor,
                                ),
                              ),
                              cursorColor: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 35.00,
                              right: 35.00,
                              top: 20.00,
                              bottom: 20.00,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Please enter article brief description';
                                }
                                briefDescription = value!;
                              },
                              minLines: 5,
                              maxLines: 10,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: darkSecondaryColor,
                                  ),
                                ),
                                labelText: 'Article Brief Description',
                                labelStyle: TextStyle(
                                  color: darkSecondaryColor,
                                ),
                              ),
                              cursorColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        10.0,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: darkSecondaryColor,
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            Article newArticle = Article(
                              title: articleTitle,
                              source: articleSource,
                              publishedDate: articlePublishedDate,
                              imageUrl: imageUrl,
                              articleUrl: articleUrl,
                              briefDescription: briefDescription,
                            );
                            addNewArtikel(newArticle).then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    value,
                                  ),
                                ),
                              );
                            });
                            Navigator.pushNamed(
                              context,
                              TipsAndTricksListPage.routeName,
                            );
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(
                            right: 20.0,
                            left: 20.0,
                          ),
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
