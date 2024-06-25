import '../model/news.dart';

List<News> dummyNews = [
  News(
    imageUrl: 'https://img.etimg.com/thumb/msid-111208834,width-300,height-225,imgsize-2160253,resizemode-75/kejriwal.jpg',
    heading: 'Arvind Kejriwal Bail Hearing Live Updates: AAP Chief To Remain In Jail, High Court Stays Bail',
    source: 'The Economics Times',
    publishTime: DateTime.now().subtract(Duration(hours: 3)),
  ),
  News(
    imageUrl: 'https://static.toiimg.com/thumb/msid-111256488,imgsize-2616392,width-400,height-225,resizemode-72/111256488.jpg',
    heading: 'Continued detention of Pune Porsche case teen in Observation',
    source: 'Times Of India',
    publishTime: DateTime.now().subtract(Duration(hours: 5)),
  ),
  News(
    imageUrl: 'https://static.toiimg.com/thumb/msid-111259666,imgsize-4964,width-400,resizemode-4/111259666.jpg',
    heading: 'Paper leaks mess: UP govt to bring in Ordinance, life in prison for guilty',
    source: 'Times Of India',
    publishTime: DateTime.now().subtract(Duration(minutes: 30)),
  ),
];
