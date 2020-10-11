<?php

	$connect = new PDO('mysql:host=localhost;dbname=gamenews', 'root', '');

	$query = "SELECT comment.*, nick FROM comment, user WHERE user.id = comment.idUser AND idParent = '0' ORDER BY comment.id DESC";

	$statement = $connect->prepare($query);

	$statement->execute();

	$result = $statement->fetchAll();

	$output = '';
	foreach ($result as $row) {
		$output .= '
			
			<div class="jumbotron" id="custom_padding">
				<div class="row">
					<div class="col-lg-2">
						<div  class="img thumbnail" id="avatar">
							<img  src="avatar.jpg" alt=""/>
							<div class="caption post-content">
								'.$row["nick"].'
							</div>
						</div>
					</div>
					<div class="col-lg-10">
						<div class="panel panel-default">
							<div class="panel-heading">By <b>'.$row["nick"].'</b> on <i>'.$row["date"].'</i></div>
							<div class="panel-body" style="height:auto">'.$row["content"].'</div>
							<div class="panel-footer" allign="right"><button type="button" class="btn btn-default reply" id="'.$row["id"].'"> Reply</button></div>
						</div>
					</div>
				</div>
			</div>';

		$output .= get_reply_comment($connect, $row["id"]);
	}

	echo $output;

	function get_reply_comment($connect, $parent_id = 0, $marginleft = 0)
	{
		$query = "SELECT comment.*, nick FROM comment, user WHERE user.id = comment.idUser AND idParent = '".$parent_id."'";
		$output ="";
		$statement = $connect->prepare($query);
		$statement->execute();
		$result = $statement->fetchAll();
		$count = $statement->rowCount();
		if($parent_id == 0)
		{
			$marginleft = 0;
		}
		else
		{
			$marginleft = $marginleft + 48;
		}
		if($count > 0)
		{
			foreach ($result as $row) 
				{
				$output .= '
<div class="jumbotron" id="custom_padding" style="margin-left:'.$marginleft.'px">
				<div class="row">
					<div class="col-lg-2">
						<div class="img thumbnail">
							<img src="avatar.jpg" alt=""/>
							<div class="caption post-content">
								'.$row["nick"].'
							</div>
						</div>
					</div>
					<div class="col-lg-10">
						<div class="panel panel-default">
							<div class="panel-heading">By <b>'.$row["nick"].'</b> on <i>'.$row["date"].'</i></div>
							<div class="panel-body">'.$row["content"].'</div>
							<div class="panel-footer" allign="right"><button type="button" class="btn btn-default reply" id="'.$row["id"].'"> Reply</button></div>
						</div>
					</div>
				</div>
			</div>';
				
				$output .= get_reply_comment($connect, $row["id"], $marginleft);
			}
		}

		return $output;
	}
?> 

<!--style="margin-left:'.$marginleft.'px"

<div class="jumbotron" id="custom_padding">
					<div class="row">
						<div class="col-lg-2">
							<div class="img thumbnail">
								<img src="avatar.jpg" alt=""/>
								<div class="caption post-content">
									'.$row["comment_sender_name"].'
								</div>
							</div>
						</div>
						<div class="col-lg-10">
							<div class="panel-heading">By <b>'.$row["comment_sender_name"].'</b> on <i>'.$row["date"].'</i></div>
								<div class="panel-body">'.$row["comment"].'</div>
								<div class="panel-footer" allign="right"><button type="button" class="btn btn-default reply" id="'.$row["comment_id"].'"> Reply</button></div>
						</div>
					</div>
				</div>';-->