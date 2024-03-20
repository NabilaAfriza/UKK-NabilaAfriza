<?php 
$fotoid=@$_GET['id'];
$userid=@$sesi['UserID'];
$tanggalKomentar=date("Y-m-d");
$komentarID=@$_GET['komentarid'];
$komentar=@$_POST["komentar"];
$komentarBaru=@$_POST["komentarBaru"];
if(isset($_POST['TambahKomentar'])){
   $query="INSERT INTO komentar(FotoID, UserID, IsiKomentar, TanggalKomentar) VALUES(?, ?, ?, ?)";
   $stmt=$conn->prepare($query);
   $stmt->bind_param("ssss", $fotoid, $userid, $komentar, $tanggalKomentar);
   $stmt->execute();
   header("Location: ?url=detail&&id=".$fotoid);
}elseif(@$_GET['proses']=='hapus'){
   $query="DELETE FROM komentar WHERE KomentarID=? AND FotoID=? ";
   $stmt=$conn->prepare($query);
   $stmt->bind_param("ss", $komentarID, $fotoid);
   if ($stmt->execute()) {header("Location: ?url=detail&id=".$fotoid);} else {echo "Error :".$stmt->error;}
}
?>