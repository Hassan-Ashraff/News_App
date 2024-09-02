
import 'package:flutter/material.dart';
import 'package:news_app/Models/news_model.dart';

class NewsdetailsScreen extends StatefulWidget {
  const NewsdetailsScreen(
      {super.key, required this.itemOfResult, required this.detailsItem});
  final Result itemOfResult;
  final News detailsItem;


  @override
  State<NewsdetailsScreen> createState() => _NewsdetailsScreenState();
}

class _NewsdetailsScreenState extends State<NewsdetailsScreen> {
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.sizeOf(context).width;
    double heightScreen = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: heightScreen*0.46,
          leading: Padding(
           padding:  EdgeInsets.only(left: widthScreen*0.02),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: heightScreen*0.4,
                width: widthScreen*0.1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.15),
                ),
                child: Center(
                    child: Icon(
                      Icons.chevron_left,
                      size: widthScreen*0.075,
                    )),
              ),
            ),
          ),
          leadingWidth: widthScreen*0.11,
          actions: [
            InkWell(
              onTap: () {
                setState(() {
                  isSaved = !isSaved;

                });
              },
              child: Container(
                height: heightScreen*0.4,
                width: widthScreen*0.1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.15),
                ),
                child: Center(
                  child: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border_outlined,
                    size: widthScreen*0.07,
                    color: isSaved ? Colors.yellow : Colors.white,
                  ),
                ),
              ),
            ),
             SizedBox(width: widthScreen*0.02),
            InkWell(
              onTap: () {
              },
              child: Container(
                height: heightScreen*0.4,
                width: widthScreen*0.1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.15),
                ),
                child: Center(
                    child: Icon(
                      Icons.menu,
                      size: widthScreen*0.07,
                    )),
              ),
            ),
             SizedBox(width: widthScreen*0.015),
          ],
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                Positioned.fill(
                  bottom: 1,
                  child: Image.network(
                    widget.itemOfResult.multimedia[0].url ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  child: Container(
                    width: widthScreen,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: widthScreen*0.17,
                          height: heightScreen*0.045,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(widthScreen*0.01),
                                child: Text(
                                  widget.itemOfResult.itemType,
                                  style:  TextStyle(
                                      fontFamily: 'IBMPlexSans-Bold',
                                    color: Colors.white,
                                      fontSize: widthScreen*0.04
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                         SizedBox(height: heightScreen*0.015),
                        Text(
                          widget.itemOfResult.title ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'IBMPlexSans-Regular',
                            fontSize: widthScreen*0.05,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         SizedBox(height: heightScreen*0.01),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.itemOfResult.byline,
                              style: TextStyle(
                                  fontFamily: 'IBMPlexSans-Bold',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: widthScreen*0.04),
                            ),
                            Text(
                              widget.itemOfResult.createdDate.toString(),
                              style: const TextStyle(
                                fontFamily: 'IBMPlexSans-Regular',
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: heightScreen*0.03,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            stretchModes: const [
              StretchMode.blurBackground,
              StretchMode.zoomBackground,
            ],
          ),
          pinned: true,
          bottom:  PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: SizedBox(
              height: heightScreen*0.035,
              width: double.infinity,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(36.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: widthScreen*0.05),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width:widthScreen*0.1,
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://th.bing.com/th/id/R.22fb53c1b823edebd4f21cf72ed909c1?rik=k%2bqOYNGSpT1CAQ&pid=ImgRaw&r=0'),
                      ),
                    ),
                     SizedBox(width: widthScreen*0.025),
                    SizedBox(
                      child: Text('The New York Times',
                          style: TextStyle(
                              fontFamily: 'IBMPlexSans-Bold',
                            fontWeight: FontWeight.w700,
                            fontSize: widthScreen*0.04
                          )),
                    ),
                  ],
                ),
                 SizedBox(height: heightScreen*0.015),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        Text(
                          widget.itemOfResult.title ?? '',
                          style: TextStyle(
                              fontFamily: 'IBMPlexSans-Regular',
                              fontWeight: FontWeight.w700, fontSize: widthScreen*0.05),
                        ),
                      ],
                    ),
                     SizedBox(height: heightScreen*0.004),
                    Wrap(children: [
                      Text(
                        widget.itemOfResult.resultAbstract,
                        style: TextStyle(
                            fontFamily: 'IBMPlexSans-Regular',
                            fontWeight: FontWeight.w400, fontSize: widthScreen*0.045),
                      ),
                    ]),
                    SizedBox(
                      height: heightScreen*0.03,
                    ),
                    Text(
                      widget.detailsItem.copyright,
                      style: TextStyle(
                          fontFamily: 'IBMPlexSans-Bold',
                          fontWeight: FontWeight.w600,
                          fontSize: widthScreen*0.04,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
