String getStatus(String eng) {
  switch (eng) {
    case 'delayed':
      return "задержывается";
      break;
    case 'in process':
      return "в пути";
      break;
    case 'delivered':
      return "доставлен";
      break;
    default:
  }
}

String getImgByStatus(String status) {
  switch (status) {
    case 'in process':
      return 'train';
      break;
    case 'delayed':
      return 'delayed';
      break;
    case 'delivered':
      return 'delivered';
      break;
    default:
  }
}
