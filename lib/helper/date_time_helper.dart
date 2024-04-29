String convertDateTime(DateTime dateTime){

  String tahun = dateTime.year.toString();
  String bulan = dateTime.month.toString();
  String tanggal = dateTime.day.toString();
  String combine = tahun + bulan + tanggal;
  return combine;
}