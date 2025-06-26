import 'package:film_magic/features/actor/presentation/views/widgets/actor_cover.dart';
import 'package:film_magic/features/actor/presentation/views/widgets/actor_details_facts.dart';
import 'package:film_magic/features/actor/presentation/views/widgets/actor_details_overview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:film_magic/features/actor/presentation/viewmodels/actor_viewmodel.dart';

import '../../../film/data/models/film_credits_model.dart';

class ActorDetailsScreen extends StatefulWidget {
  const ActorDetailsScreen({super.key, required this.actor});

  final FilmCastModel actor;

  @override
  State<ActorDetailsScreen> createState() => _ActorDetailsScreenState();
}

class _ActorDetailsScreenState extends State<ActorDetailsScreen> {
  late Future _loadActorDetailsFuture;

  @override
  void initState() {
    _loadActorDetailsFuture = loadActorDetails();
    super.initState();
  }

  Future<void> loadActorDetails() async {
    final actorDetailViewModel = context.read<ActorViewModel>();
    await actorDetailViewModel.loadActorDetails(widget.actor.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.sizeOf(context).height * 0.35,
              automaticallyImplyLeading: false,
              leading: Card(
                color: Colors.black.withValues(alpha: 0.5),
                shape: const CircleBorder(),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => context.pop(),
                ),
              ),
              flexibleSpace: ActorDetailCover(actor: widget.actor),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Consumer<ActorViewModel>(
                  builder: (context, viewModel, _) {
                    return FutureBuilder(
                      future: _loadActorDetailsFuture,
                      builder: (context, snapshot) {
                        if (viewModel.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (viewModel.errorMessage != null) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${viewModel.errorMessage}',
                                  style: const TextStyle(color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                FilledButton(
                                  onPressed: () {
                                    setState(() {
                                      _loadActorDetailsFuture =
                                          loadActorDetails();
                                    });
                                  },
                                  child: const Text('Retry'),
                                ),
                              ],
                            ),
                          );
                        }

                        final actorDetails = viewModel.actorDetails;
                        if (actorDetails == null) {
                          return const Center(
                            child: Text('No actor details available'),
                          );
                        }

                        return Column(
                          spacing: 16.0,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ActorDetailOverview(actor: actorDetails),
                            ActorDetailsFacts(actor: actorDetails),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
