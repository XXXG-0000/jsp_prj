<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<div class="container-fluid">
    <div class="row">
        <div class="border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
            <div class="offcanvas-md offcanvas-end bg-body-tertiary" tabindex="-1" id="sidebarMenu" aria-labelledby="sidebarMenuLabel">

                <div class="offcanvas-body d-md-flex flex-column p-0 pt-lg-3 overflow-y-auto">
                    <ul class="nav nav-pills flex-column">
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2 active" aria-current="page" href="#">
                                <i class="bi bi-house"></i>
                                관리자 대시보드
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#">
                                <svg class="bi"><use xlink:href="#cup-hot"/></svg>
                                음료 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#">
                            	<svg class="bi"><use xlink:href="#cake"/></svg>
                                디저트&아이스크림 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-cart"></i>
                                	주문 관리
                                  <ul class="dropdown-menu">
    								<li><button class="dropdown-item" type="button">미수령 주문</button></li>
    								<li><button class="dropdown-item" type="button">수령 완료 주문</button></li>
  								</ul>
                            </a>                                                        
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#">
                                <i class="bi bi-people-fill"></i>
                                회원 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#">
								<i class="bi bi-file-earmark-bar-graph"></i>
                                고객의 소리
                            </a>
                        </li>
                    </ul>

                    <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-body-secondary text-uppercase">
                        <span>리포트 저장</span>
                        <a class="link-secondary" href="#" aria-label="Add a new report">
                            <svg class="bi"><use xlink:href="#plus-circle"/></svg>
                        </a>
                    </h6>
                    <ul class="nav flex-column mb-auto">
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#">
                                <i class="bi bi-calendar-month"></i>
                                이번달 정산
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#">
                                <i class="bi bi-calendar-range"></i>
                                분기별 정산
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#">
                                <i class="bi bi-calendar"></i>
                                이번년도 정산
                            </a>
                        </li>
                    </ul>

                    <hr class="my-3">
                    <ul class="nav flex-column mb-auto">
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#">
                                <svg class="bi"><use xlink:href="#door-closed"/></svg>
                                로그아웃
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>